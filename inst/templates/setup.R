
# Load report from the tidyquant R API
tqregreport::load_data(report_year = {{{ report_year }}},
                       report_quarter = {{{ report_quarter }}})

# Generate report
tqregreport::generate_report(report_year = {{{ report_year }}},
                             report_quarter = {{{ report_quarter }}},
                             render = FALSE)

