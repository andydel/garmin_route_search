**PLEASE READ LINE BY LINE**
# Project Rules and Standards

## Core Development Principles

### 🚫 **Prohibited Practices**
- **No using rm -rf** - You are NEVER to bulk delete data, databases, or files without prior user permission
- **No shortcuts** - Complete all work properly, no matter the time investment
- **No simulated results** - Use real APIs, real data, real processing only
- **No failovers** - Fix the actual problem instead of working around it
- **No graceful diversions** - Don't switch to alternate functions when primary fails
- **No hiding bugs** - Surface and fix all issues systematically
- **No simplifying long-running tests** - Let tests run to completion for accurate results
- **No presenting bad results as good** - Call failures what they are
- **No skirting issues** - Address problems head-on
- **No avoiding systematic bug fixes** - Fix root causes, not symptoms
- **No marketing messages in commit logs** - Keep commits technical and factual
- **No arbitrary timeouts** - Use appropriate timeouts based on actual requirements

### ✅ **Required Practices**

#### **Process Management**
- **Iterate todos by speed** - Execute quickest completable tasks first when possible
- **Always commit code changes** - Every change gets a small, descriptive commit message
- **Use Unit Tests** - Use unit tests when developing all code

#### **Code Organization**
- **Move temporary scripts to tmp/** - Clean learning/debug scripts after use
- **Clean up test files, also move to tmp/** - Don't leave millions of small one off test files around, keep directories tidy
- **Never rename functions/files** - Avoid breaking dependencies unless absolutely necessary


#### **Testing Standards**
- **Design tests to fail loudly** - Tests should clearly report issues for immediate fixing
- **Tests must complete** - No early termination or result simulation

#### **Logging Standards**
- **Avoid task completion sludge** - Focus on answers and intelligence, not status updates
- **Target actionable information** - Logs should help decide whether to continue or stop
- **Important messages only** - Verbose logging should be optional and toggleable
- **Focus on decision-critical data** - What information is needed to make progress decisions?

#### **Task Planning**
- **Prefix ToDo items with this exact text "Read docs/Rules.md, then:"** - By doing this we help all agents understand the development standards to follow.
- **Rich Task Descriptions** - All tasks on our project must be clearly articulated and described, and as they are done in parallel by new people we need EACH task description to include a little about the Purpose and Objective of the wider project, plus the task description must explain the architecture to follow, the tools to use. Rich descriptions that leave nothing to interpretation are the best. 
 
## Implementation Guidelines

### **When Working on Long-Running Tasks**
- Report meaningful progress indicators
- Log performance metrics that inform decisions
- Timestamp all major phases
- Report failures immediately and clearly

### **When Debugging Issues**
- Identify root cause systematically
- Fix underlying problems, not symptoms  
- Test fixes thoroughly before proceeding
- Document solutions for future reference

### **When Writing Tests**
- Use real APIs and real data processing
- Design for clear pass/fail outcomes
- Report specific failure reasons
- Include performance benchmarks where relevant


# Important Information
- our objective is to build tools that support real work, and are helpful and useful in the real world
- our team don't say things like "absolutely" or "breakthrough!" unless it's very very necessary. Don't annoy everyone with this over enthusiasm - be moderate in your enthusiasm. 
---

*These rules ensure systematic progress, reliable results, and maintainable code. No exceptions.*

