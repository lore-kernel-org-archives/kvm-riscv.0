From: Marc Zyngier <maz@kernel.org>
Date: Thu, 22 Aug 2024 15:24:54 +0100
Subject: (subset) [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest memory while KVM is dirty logging
In-Reply-To: <20240726235234.228822-3-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
Message-ID: <172433664068.3702537.15170661496841359831.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 26 Jul 2024 16:51:11 -0700, Sean Christopherson wrote:
> Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> writing guest memory without marking the gfn as dirty in the memslot could
> result in userspace failing to migrate the updated page.  Ideally (maybe?),
> KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> and presumably the only use case for copy MTE tags _to_ the guest is when
> restoring state on the target.
> 
> [...]

Applied to next, thanks!

[02/84] KVM: arm64: Disallow copying MTE to guest memory while KVM is dirty logging
        commit: e0b7de4fd18c47ebd47ec0dd1af6503d4071b943

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



