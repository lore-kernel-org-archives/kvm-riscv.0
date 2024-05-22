From: patchwork-bot+linux-riscv@kernel.org <patchwork-bot+linux-riscv@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
Subject: [PATCH] KVM: selftest: Define _GNU_SOURCE for all selftests code
In-Reply-To: <20240423190308.2883084-1-seanjc@google.com>
References: <20240423190308.2883084-1-seanjc@google.com>
Message-ID: <171642074371.9409.16238055569874422523.git-patchwork-notify@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello:

This patch was applied to riscv/linux.git (fixes)
by Sean Christopherson <seanjc@google.com>:

On Tue, 23 Apr 2024 12:03:08 -0700 you wrote:
> Define _GNU_SOURCE is the base CFLAGS instead of relying on selftests to
> manually #define _GNU_SOURCE, which is repetitive and error prone.  E.g.
> kselftest_harness.h requires _GNU_SOURCE for asprintf(), but if a selftest
> includes kvm_test_harness.h after stdio.h, the include guards result in
> the effective version of stdio.h consumed by kvm_test_harness.h not
> defining asprintf():
> 
> [...]

Here is the summary with links:
  - KVM: selftest: Define _GNU_SOURCE for all selftests code
    https://git.kernel.org/riscv/c/730cfa45b5f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



