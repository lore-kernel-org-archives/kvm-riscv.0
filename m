From: David Matlack <dmatlack@google.com>
Date: Mon, 12 Dec 2022 17:11:02 -0800
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
In-Reply-To: <Y5dwQEJHNiTPE+jz@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com>
 <Y5dwQEJHNiTPE+jz@google.com>
Message-ID: <Y5fRJr34/BnsE+Dv@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 06:17:36PM +0000, Oliver Upton wrote:
> On Mon, Dec 12, 2022 at 05:39:38PM +0000, Sean Christopherson wrote:
> > On Fri, Dec 09, 2022, David Matlack wrote:
> > > On Fri, Dec 9, 2022 at 9:25 AM Oliver Upton <oliver.upton@linux.dev> wrote:
> > My preference would be to leave .smm in x86's page role.  IMO, defining multiple
> > address spaces to support SMM emulation was a mistake that should be contained to
> > SMM, i.e. should never be used for any other feature.  And with CONFIG_KVM_SMM,
> > even x86 can opt out.
> 
> +1
> 
> I don't think something is architecture-neutral by virtue of it existing
> in virt/kvm/*.

Put another way, just because something exists in virt/kvm/* doesn't
mean it is used (or will be useful) to more than one architecture.
Totally agree.  In this case, there never turned out to be any other
usecases for memslot address spaces.

As for role.arch.smm vs role.as_id, I'll post my response on the other
thread with Paolo. Juggling these threads is hard.

