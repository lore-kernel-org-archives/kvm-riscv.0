From: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Jun 2024 08:32:18 -0700
Subject: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
In-Reply-To: <504fa0a7264d4762afda2f13c3525ce5@huawei.com>
References: <20230916003118.2540661-1-seanjc@google.com> <504fa0a7264d4762afda2f13c3525ce5@huawei.com>
Message-ID: <ZnmRgqD6FmXNNzzI@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 20, 2024, Shameerali Kolothum Thodi wrote:
> > This is a borderline RFC series to hide KVM's internals from the rest of
> > the kernel, where "internals" means data structures, enums, #defines,
> > APIs, etc. that are intended to be KVM-only, but are exposed everywhere
> > due to kvm_host.h (and other headers) living in the global include paths.
>
> Hi Sean,
> 
> Just thought of checking with you on this series. Do you have plans to revive this
> series?

Yep!

> The reason I am asking is, on ARM64/KVM side we do have a requirement
> to share the KVM VMID with SMMUV3. Please see the RFC I sent out earlier this
> year[1]. The series basically provides a way for KVM to pin a VMID and also
> associates an iommufd ctx with a struct kvm * to retrieve that VMID. 
> 
> As mentioned above, some of the patches in this series(especially 1-4 & 6) that
> does the VFIO cleanups and dropping CONFIG_KVM_VFIO looks very straightforward
> and useful. I am thinking of including those when I re-spin my RFC series, if
> that?s ok.

Please don't include them, as the patch they build towards (patch 5) is buggy[*],
and I am fairly certain that at least some of the patches will change significantly.

I expect to re-start working on the series in ~2 weeks, and am planning on actively
pushing the series (i.e. not ignoring it for months on end).

[*] https://lore.kernel.org/all/ZWp_q1w01NCZi8KX at google.com

> Please let me know your thoughts.
>
> [1]. https://lore.kernel.org/linux-iommu/20240209115824.GA2922446 at myrica 

