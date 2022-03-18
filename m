From: Marc Zyngier <maz@kernel.org>
Date: Fri, 18 Mar 2022 14:07:20 +0000
Subject: (subset) [PATCH v4 00/15] KVM: arm64: PSCI SYSTEM_SUSPEND +
 SYSTEM_RESET2 bugfix
In-Reply-To: <20220311174001.605719-1-oupton@google.com>
References: <20220311174001.605719-1-oupton@google.com>
Message-ID: <164761240231.2295955.10089198303947734980.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 11 Mar 2022 17:39:46 +0000, Oliver Upton wrote:
> **NOTE** Patch 2 is a bugfix for commit d43583b890e7 ("KVM: arm64:
> Expose PSCI SYSTEM_RESET2 call to the guest") on kvmarm/next. Without
> this patch, it is possible for the guest to call
> PSCI_1_1_FN64_SYSTEM_RESET2 from AArch32.
> 
> The PSCI v1.0 specification describes a call, SYSTEM_SUSPEND, which
> allows software to request that the system be placed into the lowest
> possible power state and await an IMPLEMENTATION DEFINED wakeup event.
> This call is optional in v1.0 and v1.1. KVM does not currently support
> this optional call.
> 
> [...]

Applied to next, thanks!

[01/15] KVM: arm64: Generalise VM features into a set of flags
        commit: 06394531b425794dc56f3d525b7994d25b8072f7

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



