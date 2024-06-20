From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Date: Thu, 20 Jun 2024 10:10:59 +0000
Subject: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
Message-ID: <504fa0a7264d4762afda2f13c3525ce5@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Sean Christopherson <seanjc@google.com>
> Sent: Saturday, September 16, 2023 1:31 AM
> To: Catalin Marinas <catalin.marinas@arm.com>; Will Deacon
> <will@kernel.org>; Marc Zyngier <maz@kernel.org>; Oliver Upton
> <oliver.upton@linux.dev>; Huacai Chen <chenhuacai@kernel.org>; Michael
> Ellerman <mpe@ellerman.id.au>; Anup Patel <anup@brainfault.org>; Paul
> Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>; Heiko
> Carstens <hca@linux.ibm.com>; Vasily Gorbik <gor@linux.ibm.com>;
> Alexander Gordeev <agordeev@linux.ibm.com>; Christian Borntraeger
> <borntraeger@linux.ibm.com>; Janosch Frank <frankja@linux.ibm.com>;
> Claudio Imbrenda <imbrenda@linux.ibm.com>; Thomas Gleixner
> <tglx@linutronix.de>; Ingo Molnar <mingo@redhat.com>; Borislav Petkov
> <bp@alien8.de>; Dave Hansen <dave.hansen@linux.intel.com>;
> x86 at kernel.org; Peter Zijlstra <peterz@infradead.org>; Arnaldo Carvalho de
> Melo <acme@kernel.org>; Sean Christopherson <seanjc@google.com>;
> Paolo Bonzini <pbonzini@redhat.com>; Tony Krowiak
> <akrowiak@linux.ibm.com>; Halil Pasic <pasic@linux.ibm.com>; Jason Herne
> <jjherne@linux.ibm.com>; Harald Freudenberger <freude@linux.ibm.com>;
> Alex Williamson <alex.williamson@redhat.com>; Andy Lutomirski
> <luto@kernel.org>
> Cc: linux-arm-kernel at lists.infradead.org; kvmarm at lists.linux.dev; linux-
> mips at vger.kernel.org; kvm at vger.kernel.org; linuxppc-dev at lists.ozlabs.org;
> kvm-riscv at lists.infradead.org; linux-riscv at lists.infradead.org; linux-
> s390 at vger.kernel.org; linux-kernel at vger.kernel.org; linux-perf-
> users at vger.kernel.org; Anish Ghulati <aghulati@google.com>; Venkatesh
> Srinivas <venkateshs@chromium.org>; Andrew Thornton
> <andrewth@google.com>
> Subject: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
> 
> This is a borderline RFC series to hide KVM's internals from the rest of
> the kernel, where "internals" means data structures, enums, #defines,
> APIs, etc. that are intended to be KVM-only, but are exposed everywhere
> due to kvm_host.h (and other headers) living in the global include paths.
> 
> The motiviation for hiding KVM's internals is to allow *safely* loading a
> "new" KVM module without having to reboot the host.  Where "new" doesn't
> have to be strictly newer, just a different incarnation of KVM.  Hiding
> KVM's internals means those assets can change across KVM instances
> without
> breaking things, e.g. would allow modifying the layout of struct kvm_vcpu
> to introduce new fields related to a new feature or mitigation for hardware
> bugs.
> 
> The end goal for all of this is to allow loading and running multiple
> instances of KVM (the module) simultaneously on a single host, e.g. to
> deploy fixes, mitigations, and/or new features without having to drain
> all VMs from the host.
> 
> For now, the immediate goal is to get KVM to a state where KVM x86 doesn't
> expose anything to the broader world that isn't intended for external
> consumption, e.g. the page write-tracking APIs used by KVM-GT.
> 
> I say this is borderline RFC because I don't think I've "formally" proposed
> the idea of hiding KVM internals before now.  I decided not to tag this RFC
> because the changes ended up being not _that_ invasive, and everything
> before the last six patches is worthwhile even if hiding internals is
> ultimately rejected (IMO).
> 
> This would ideally be ~5 separate series, and I certainly have no objection
> if that's how we want to get this stuff merged.  E.g. (1) VFIO cleanups,
> (2) drop HAVE_KVM, (3) clean up makefiles, (4) x86 perf cleanup, and
> (5) final push for hiding state.  The HAVE_KVM and virt/kvm include stuff
> isn't strictly necessary, but I included them here because they're
> relatively minor (in the grand scheme).

Hi Sean,

Just thought of checking with you on this series. Do you have plans to revive this
series? The reason I am asking is, on ARM64/KVM side we do have a requirement
to share the KVM VMID with SMMUV3. Please see the RFC I sent out earlier this
year[1]. The series basically provides a way for KVM to pin a VMID and also
associates an iommufd ctx with a struct kvm * to retrieve that VMID. 

As mentioned above, some of the patches in this series(especially 1-4 & 6) that
does the VFIO cleanups and dropping CONFIG_KVM_VFIO looks very straightforward
and useful. I am thinking of including those when I re-spin my RFC series, if that?s ok.

Please let me know your thoughts.

Thanks,
Shameer

[1]. https://lore.kernel.org/linux-iommu/20240209115824.GA2922446 at myrica/

