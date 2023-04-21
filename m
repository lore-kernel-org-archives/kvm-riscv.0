From: Marc Zyngier <maz@kernel.org>
Date: Fri, 21 Apr 2023 18:10:57 +0100
Subject: [PATCH 9/9] KVM: arm64: Run clear-dirty-log under MMU read lock
In-Reply-To: <20230421165305.804301-10-vipinsh@google.com>
References: <20230421165305.804301-1-vipinsh@google.com>
	<20230421165305.804301-10-vipinsh@google.com>
Message-ID: <86pm7xjh3y.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 21 Apr 2023 17:53:05 +0100,
Vipin Sharma <vipinsh@google.com> wrote:
> 
> Take MMU read lock for write protecting PTEs and use shared page table
> walker for clearing dirty logs.
> 
> Clearing dirty logs are currently performed under MMU write locks. This
> means vCPUs write protection fault, which also take MMU read lock,  will
> be blocked during this operation. This causes guest degradation and
> especially noticeable on VMs with lot of vCPUs.
> 
> Taking MMU read lock will allow vCPUs to execute parallelly and reduces
> the impact on vCPUs performance.

Sure. Taking no lock whatsoever would be even better.

What I don't see is the detailed explanation that gives me the warm
feeling that this is safe and correct. Such an explanation is the
minimum condition for me to even read the patch.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

