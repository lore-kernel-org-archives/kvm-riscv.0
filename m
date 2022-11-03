From: Claudio Imbrenda <imbrenda@linux.ibm.com>
Date: Thu, 3 Nov 2022 14:21:17 +0100
Subject: [PATCH 25/44] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
In-Reply-To: <20221103134415.5b277ce9@p-imbrenda>
References: <20221102231911.3107438-1-seanjc@google.com>
	<20221102231911.3107438-26-seanjc@google.com>
	<20221103134415.5b277ce9@p-imbrenda>
Message-ID: <20221103142117.4e27c80c@p-imbrenda>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 3 Nov 2022 13:44:15 +0100
Claudio Imbrenda <imbrenda@linux.ibm.com> wrote:

> On Wed,  2 Nov 2022 23:18:52 +0000
> Sean Christopherson <seanjc@google.com> wrote:
> 
> > Move the guts of kvm_arch_init() into a new helper, __kvm_s390_init(),
> > and invoke the new helper directly from kvm_s390_init() instead of
> > bouncing through kvm_init().  Invoking kvm_arch_init() is the very
> > first action performed by kvm_init(), i.e. this is a glorified nop.
> > 
> > Moving setup to __kvm_s390_init() will allow tagging more functions as
> > __init, and emptying kvm_arch_init() will allow dropping the hook
> > entirely once all architecture implementations are nops.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/s390/kvm/kvm-s390.c | 29 +++++++++++++++++++++++++----
> >  1 file changed, 25 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> > index 7fcd2d3b3558..e1c9980aae78 100644
> > --- a/arch/s390/kvm/kvm-s390.c
> > +++ b/arch/s390/kvm/kvm-s390.c
> > @@ -461,7 +461,7 @@ static void kvm_s390_cpu_feat_init(void)
> >  	 */
> >  }
> >  
> > -int kvm_arch_init(void *opaque)
> > +static int __kvm_s390_init(void)
> >  {
> >  	int rc = -ENOMEM;
> >  
> > @@ -519,7 +519,7 @@ int kvm_arch_init(void *opaque)
> >  	return rc;
> >  }
> >  
> > -void kvm_arch_exit(void)
> > +static void __kvm_s390_exit(void)
> >  {
> >  	gmap_unregister_pte_notifier(&gmap_notifier);
> >  	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
> > @@ -533,6 +533,16 @@ void kvm_arch_exit(void)
> >  	debug_unregister(kvm_s390_dbf_uv);
> >  }
> >  
> > +int kvm_arch_init(void *opaque)
> > +{
> > +	return 0;
> > +}
> > +
> > +void kvm_arch_exit(void)
> > +{
> > +
> > +}
> > +  
> 
> I wonder at this point if it's possible to define kvm_arch_init and
> kvm_arch_exit directly in kvm_main.c with __weak

ah, nevermind, you get rid of them completely in the next patch

> 
> >  /* Section: device related */
> >  long kvm_arch_dev_ioctl(struct file *filp,
> >  			unsigned int ioctl, unsigned long arg)
> > @@ -5634,7 +5644,7 @@ static inline unsigned long nonhyp_mask(int i)
> >  
> >  static int __init kvm_s390_init(void)
> >  {
> > -	int i;
> > +	int i, r;
> >  
> >  	if (!sclp.has_sief2) {
> >  		pr_info("SIE is not available\n");
> > @@ -5650,12 +5660,23 @@ static int __init kvm_s390_init(void)
> >  		kvm_s390_fac_base[i] |=
> >  			stfle_fac_list[i] & nonhyp_mask(i);
> >  
> > -	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> > +	r = __kvm_s390_init();
> > +	if (r)
> > +		return r;
> > +
> > +	r = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> > +	if (r) {
> > +		__kvm_s390_exit();
> > +		return r;
> > +	}
> > +	return 0;
> >  }
> >  
> >  static void __exit kvm_s390_exit(void)
> >  {
> >  	kvm_exit();
> > +
> > +	__kvm_s390_exit();
> >  }
> >  
> >  module_init(kvm_s390_init);  
> 


