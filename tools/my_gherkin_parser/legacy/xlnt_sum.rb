require 'writeexcel'

$VERBOSE = false # kinda overly verbose
# $VERBOSE     =true # kinda overly verbose
output_disp = false # show enuf info
# output_disp  =true # show enuf info
write_enabled = true # excel writeout

# Where to search <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# dir_loc      ='features/scenarios/Reg*/*/**/*.feature'
# dir_loc      ='../../../**/scenarios/**/uat_reg/**/*.feature'
# dir_loc      ='./**/*.feature'
# dir_loc      = './features/**/*.feature'
# dir_loc = './jira*/**/*.feature'
# dir_loc = '../features/uat/gcm/jira_stories/**/*.feature'
dir_loc = '../features/uat/gcm/regression/reg-done-list/**/*.feature'

# Where to write <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
#output_file='scen_kyu_phinally.xls'
# output_file  ='scen_kyu_e2e_reW.xls'
# output_file  ="scen_kyu_func_#{Time.now.strftime '%F_%H-%M-%S'}.xls"
output_file = "scen_UAT-jiras_#{Time.now.strftime '%F_%H-%M-%S'}.xls"


all = []
dir_loc = '../features/uat/gcm/regression/gcm-legacy/**/*.feature'; output_file = "scen_UAT-gcm_legacy_#{Time.now.strftime '%F_%H-%M-%S'}.xls"
all << [dir_loc, output_file]
dir_loc = '../features/uat/gcm/regression/reg-done-list/**/*.feature'; output_file = "scen_UAT-reg_done_#{Time.now.strftime '%F_%H-%M-%S'}.xls"
all << [dir_loc, output_file]
dir_loc = '../features/uat/gcm/jira_stories/**/*.feature'; output_file = "scen_UAT-jiras_#{Time.now.strftime '%F_%H-%M-%S'}.xls"
all << [dir_loc, output_file]

all.each do |dir_loc, output_file|

# What to look for <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# states       = %w[AR GA MS IN CA] #
# states       = %w[OH] #
  states = %w[] #

# col_list =[:ignore, :mock, :run, :defect, :other]
  $col_list = [:ignore, :mock, :run, :defect, :uat_done, :cmo_done, :tech_done, :prod_done, :jira, :other]
  col_list = $col_list

#And How to write <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# Hint : ["(necessary)Column_Title;(optional)Column_Width [units in points ~ roughly a character in width]"  and so on]
# title_hai    =["Sl.No;4", "Type;4", "Title;60", states.map { |a| a+";2" }, "CIT;10", "special;15", "delta;15", "Other;25", "Feature;10", "S.no;3", "File"].flatten
  title_hai = ["Sl.No;4", "Type;4", "Title;60", states.map {|a| a + ";2"}, col_list.map {|a| "#{a};10"}, "Feature;10", "S.no;3", "File"].flatten


# Hood begins here.. feel free to go under >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  globbed_res = Dir.glob(dir_loc).reject {|x| x =~ /todo/}

  def reset col_list = $col_list
    # $scen_tags={:state => [], :special => [], :cit => [], :rtc => [], :other => [], :delta => [], :S_title => [], :S_type => []}
    $scen_tags = {:state => [],
                  # :ignore => [], :mock => [], :run => [], :other => [], :defect => [],
                  # :uat_done => [], :cmo_done => [], :tech_done => [], :prod_done => [], :jira => [],
                  :S_title => [], :S_type => []}
    col_list.each {|key| $scen_tags[key] = []}
  end

  def sort_tags(unsorted_tags)
    unsorted_tags[0].push(*$feature_tags)
    unsorted_tags[0].each {|tag|
      location = case tag
                 when /@[A-Z]{2}$/
                   :state
                 when /@ignore/
                   :ignore
                 when /@mock/
                   :mock
                 when /@run/
                   :run
                 when /@defect/
                   :defect
                 when /@uat_done/
                   :uat_done
                 when /@cmo_done/
                   :cmo_done
                 when /@tech_done/
                   :tech_done
                 when /@prod_done/
                   :prod_done
                   # when /@[\d.]+/
                 when /@[0-9.]+/
                   :jira
                 else
                   :other
                 end
      $scen_tags[location] << tag[1..-1]
    }
    $scen_tags[:S_type] = [unsorted_tags[1][0].strip] if unsorted_tags[1][0]
    $scen_tags[:S_title] = [unsorted_tags[1][1].strip] if unsorted_tags[1][1]
    $scen_tags.each {|kod| $scen_tags[kod[0]] = $scen_tags[kod[0]].uniq}
    $arr << [$scen_tags]
    p $scen_tags if $VERBOSE
#TODO: Reset $scen_tags
    reset # resets the $scen_tags
  end

# Excel Setup >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  $exc_no = 1
  workbook = WriteExcel.new(output_file)
  worksheet = workbook.add_worksheet
  format = workbook.add_format(:size => 10, :bold => 1); format.set_align('center') #format.set_bold
  state_f = workbook.add_format(:size => 8, :align => "center") #state_f.set_align('center')
  worksheet.write('A1', title_hai.map {|itr| itr.split(";")[0]}, format)

  title_hai.each_with_index do |itr, i|
    worksheet.set_column(i, i, itr.split(";")[1].to_i) if itr.split(";")[1]
  end

  p t_start = Time.now
  globbed_res.each do |file|
    p file #if $VERBOSE
    f = File.open(file, 'r')

# Scenario Pickout >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#TODO Caution: ok.. this is under the engine now.. dont burn yourself!
    hit_feature = hit_new_scen = hit_new_outline = hit_examples = hit_background = false
    reset # resets the $scen_tags
    unsorted_tags = []; outline_tags = []; $feature_tags = []; $arr = []
    scen_count = 0; $next_scen = 0
    $scen_text = ""
    $in_outline = $touched_eg = getting_scen_text = $in_feature = false

    f.readlines.each do |line|
      line.strip! #watchout for strip!.. gives a nil at times!!

      if line =~ /^#/
        print "Commented Line :#{line}" + " \n" if $VERBOSE
        next
      elsif line =~ /^@/
        unsorted_tags.push(*line.split(" "))
        ($in_feature = false; sort_tags([[], $scen_text.split(":")])) if $in_feature # to skip from feature as soon as a tag is reached!
        next
      elsif line == ""
        ($in_feature = false; sort_tags([[], $scen_text.split(":")])) if $in_feature
        next
      end

      hit_feature = hit_new_scen = hit_new_outline = hit_examples = hit_background = false
      currently_in_outline_too = false
      case line
      when /Feature:/
        hit_feature = $in_feature = true; p "Hit Feature" if $VERBOSE
      when /Background:/
        hit_background = true; p "Hit Background" if $VERBOSE
      when /Scenario:/
        hit_new_scen = true; p "Hit Scen" if $VERBOSE
      when /Scenario Outline:/
        hit_new_outline = $in_outline = true; currently_in_outline_too = true; p "Hit scen outlines" if $VERBOSE
      when /Examples:/
        hit_examples = true; p "Hit examples" if $VERBOSE
      end

      if hit_feature or $in_feature
        unless hit_background or hit_new_scen or hit_new_outline
          $scen_text = ($scen_text.to_s + " " + line).strip
          $feature_tags.push(*unsorted_tags); unsorted_tags = []
        else
          $in_feature = false
          #put_bkground_text if hit_background # if necessary
          sort_tags([[], $scen_text.split(":")])
          next
        end
      end

      if getting_scen_text
        unless getting_scen_text = line !~ /^Given|When|Then|And|But/
          unless $in_outline
            sort_tags([unsorted_tags, $scen_text.split(":")]); unsorted_tags = []
          end
        else
          $scen_text = $scen_text + " " + line
        end
        next
      end

      if hit_examples
        outline_tags.push(*unsorted_tags); unsorted_tags = []
        $touched_eg = $in_outline = true
        next
      end

      if hit_new_outline or hit_new_scen
        scen_count += 1
        getting_scen_text = true
        if $in_outline and $touched_eg
          sort_tags([outline_tags, $scen_text.split(":")])
          outline_tags = [];
          $in_outline = currently_in_outline_too;
          $touched_eg = false
        end
        $scen_text = line
        next
      end
    end
    unless outline_tags == []
      sort_tags([outline_tags, $scen_text.split(":")]); outline_tags = []; $in_outline = false; $touched_eg = false
    end

    $arr.each {|kk| p kk} if $VERBOSE or output_disp

# Excel Write >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Ok.. now the chassis.. for all the cushioning and a comfortable ride
    if write_enabled
      itr = 0
      $feat_stuff = {}

      col_recog = title_hai.map {|each| each.split(";")[0].downcase}
      # col_list =[:cit, :special, :delta, :rtc, :other]
      # col_list =$col_list

      $arr.each {|each_scen_tag|
        scen_info = each_scen_tag[0]
        ($feat_tags = scen_info; itr += 1; next) if itr == 0

        worksheet.write($exc_no, 0, $exc_no, format)
        worksheet.write($exc_no, 1, scen_info[:S_type][0].gsub(/cenario|utline/, ""))
        worksheet.write($exc_no, 2, scen_info[:S_title][0].to_s.force_encoding("UTF-8"))

        scen_info[:state].each do |st|
          worksheet.write($exc_no, col_recog.index(st.downcase), st, state_f)
          #worksheet.write($exc_no, 3+state_list[st].to_i, st, state_f)
          #worksheet.write($exc_no, 3+state_list[st].to_i, "X",state_f)
        end
        col_list.each {|key| worksheet.write($exc_no, col_recog.index(key.to_s), scen_info[key].join(","))}
        worksheet.write($exc_no, title_hai.size - 3, $feat_tags[:S_title])
        worksheet.write($exc_no, title_hai.size - 2, itr, workbook.add_format(:size => 8, :align => "center"))
        worksheet.write($exc_no, title_hai.size - 1, file.gsub("features/scenarios", ""))

        $exc_no += 1; itr += 1
      }
    end
  end
# Prog done.. >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  workbook.close
# Tyres.. (PS: cheers! if you got all the Auto analogies all along..)
  p t_end = Time.now
  p t_end - t_start

end
