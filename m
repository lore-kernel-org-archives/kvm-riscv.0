From: Huang, Kai <kai.huang@intel.com>
Date: Thu, 10 Nov 2022 02:20:57 +0000
Subject: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
In-Reply-To: <4f523a166badbd61a1cfb6269334e9c9354ade64.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-39-seanjc@google.com>
	 <4f523a166badbd61a1cfb6269334e9c9354ade64.camel@intel.com>
Message-ID: <d1d4f912292fbfb4f7d88940f22eb9fbcc582ba1.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2022-11-10 at 01:08 +0000, Huang, Kai wrote:
> > -	WARN_ON(!irqs_disabled());
> > +	/*
> > +	 * Compatibility checks are done when loading KVM and when enabling
> > +	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
> > +	 * compatible, i.e. KVM should never perform a compatibility check
> > on
> > +	 * an offline CPU.
> > +	 */
> > +	WARN_ON(!irqs_disabled() && cpu_active(cpu));
> 
> Comment doesn't match with the code?
> 
> "KVM should never perform a compatibility check on on offline CPU" should be
> something like:
> 
> 	WARN_ON(!cpu_online(cpu));
> 
> So, should the comment be something like below?
> 
> "KVM compatibility check happens before CPU is marked as active".

Also ignore this one as I only thought about hotplug case.
