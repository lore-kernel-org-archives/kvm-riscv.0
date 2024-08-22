From: Marc Zyngier <maz@kernel.org>
Date: Thu, 22 Aug 2024 15:24:11 +0100
Subject: (subset) [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if copying MTE tags hits ZONE_DEVICE
In-Reply-To: <20240726235234.228822-2-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-2-seanjc@google.com>
Message-ID: <172433664067.3702537.13271681605926473288.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 26 Jul 2024 16:51:10 -0700, Sean Christopherson wrote:
> Put the page reference acquired by gfn_to_pfn_prot() if
> kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
> than-stellar heuristics for dealing with pfn-mapped memory means that KVM
> can get a page reference to ZONE_DEVICE memory.
> 
> 

Applied to next, thanks!

[01/84] KVM: arm64: Release pfn, i.e. put page, if copying MTE tags hits ZONE_DEVICE
        commit: ae41d7dbaeb4f79134136cd65ad7015cf9ccf78a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



