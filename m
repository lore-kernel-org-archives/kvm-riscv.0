From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 29 Feb 2024 12:48:11 +0100
Subject: [kvm-unit-tests PATCH 03/13] treewide: lib/stack: Fix backtrace
In-Reply-To: <CZH8V1T0Z3QN.1ZVFAXR4B96BZ@wheely>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
 <20240228150416.248948-18-andrew.jones@linux.dev>
 <CZH8V1T0Z3QN.1ZVFAXR4B96BZ@wheely>
Message-ID: <20240229-b470bcfe6538d0fea44ab3e3@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 29, 2024 at 01:31:52PM +1000, Nicholas Piggin wrote:
> On Thu Feb 29, 2024 at 1:04 AM AEST, Andrew Jones wrote:
...
> > diff --git a/lib/stack.h b/lib/stack.h
> > index 10fc2f793354..6edc84344b51 100644
> > --- a/lib/stack.h
> > +++ b/lib/stack.h
> > @@ -11,17 +11,27 @@
> >  #include <asm/stack.h>
> >  
> >  #ifdef HAVE_ARCH_BACKTRACE_FRAME
> > -extern int backtrace_frame(const void *frame, const void **return_addrs,
> > -			   int max_depth);
> > +extern int arch_backtrace_frame(const void *frame, const void **return_addrs,
> > +				int max_depth, bool current_frame);
> > +
> > +static inline int backtrace_frame(const void *frame, const void **return_addrs,
> > +				  int max_depth)
> > +{
> > +	return arch_backtrace_frame(frame, return_addrs, max_depth, false);
> > +}
> > +
> > +static inline int backtrace(const void **return_addrs, int max_depth)
> > +{
> > +	return arch_backtrace_frame(NULL, return_addrs, max_depth, true);
> > +}
> >  #else
> > -static inline int
> > -backtrace_frame(const void *frame __unused, const void **return_addrs __unused,
> > -		int max_depth __unused)
> > +extern int backtrace(const void **return_addrs, int max_depth);
> > +
> > +static inline int backtrace_frame(const void *frame, const void **return_addrs,
> > +				  int max_depth)
> >  {
> >  	return 0;
> >  }
> >  #endif
> >  
> > -extern int backtrace(const void **return_addrs, int max_depth);
> > -
> >  #endif
> 
> Is there a reason to add the inline wrappers rather than just externs
> and drop the arch_ prefix?

Only reason is to avoid duplicating the functions in each arch, but
since they're oneliners which won't likely change, then we could
duplicate them instead, if preferred, but I'm not sure what the
benefit of that over the static inlines would be.

> 
> Do we want to just generally have all arch specific functions have an
> arch_ prefix? Fine by me.

We've been slowly doing that over in 'KVM selftests', which has improved
readability, so slowly adopting it here too in kvm-unit-tests would be
nice.

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
> I'm fine to rebase the powerpc patch on top of this if it goes in first.
> Thanks for the heads up.
> 

Thanks,
drew

