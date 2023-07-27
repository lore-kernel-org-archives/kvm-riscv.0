From: Xu Yilun <yilun.xu@intel.com>
Date: Thu, 27 Jul 2023 11:24:22 +0800
Subject: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
In-Reply-To: <ZMFC+V6Llv1JWLEt@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-9-seanjc@google.com>
 <ZL4BiQWihfrD0TOJ@yilunxu-OptiPlex-7050>
 <ZMFC+V6Llv1JWLEt@google.com>
Message-ID: <ZMHjZvcmzxMhTyM3@yilunxu-OptiPlex-7050>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-07-26 at 08:59:53 -0700, Sean Christopherson wrote:
> On Mon, Jul 24, 2023, Xu Yilun wrote:
> > On 2023-07-18 at 16:44:51 -0700, Sean Christopherson wrote:
> > > +	if (WARN_ON_ONCE(start == end))
> > > +		return -EINVAL;
> > 
> > Also, is this check possible to be hit? Maybe remove it?
> 
> It should be impossible to, hence the WARN.  I added the check for two reasons:
> (1) to help document that end is exclusive, and (2) to guard against future bugs.

Understood. I'm good to it.

