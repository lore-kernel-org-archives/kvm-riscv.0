From: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Jan 2024 16:59:21 -0800
Subject: [PATCH 0/5] KVM: selftests: Remove redundant newlines
In-Reply-To: <20231206170241.82801-7-ajones@ventanamicro.com>
References: <20231206170241.82801-7-ajones@ventanamicro.com>
Message-ID: <170629088388.3096286.8233473691080181709.b4-ty@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 06 Dec 2023 18:02:42 +0100, Andrew Jones wrote:
> This series has a lot of churn for dubious value, but I'm posting it
> anyway since I've already done the work. Each patch in the series is
> simply removing trailing newlines from format strings in TEST_* function
> callsites, since TEST_* functions append their own. The first patch
> addresses common lib and test code, the rest of the changes are split
> by arch in the remaining patches.
> 
> [...]

Applied to kvm-x86 selftests, with the fix for the "tsc\n" bug.  Thanks!

[1/5] KVM: selftests: Remove redundant newlines
      https://github.com/kvm-x86/linux/commit/250e138d8768
[2/5] KVM: selftests: aarch64: Remove redundant newlines
      https://github.com/kvm-x86/linux/commit/95be17e4008b
[3/5] KVM: selftests: riscv: Remove redundant newlines
      https://github.com/kvm-x86/linux/commit/93e43e50b80b
[4/5] KVM: selftests: s390x: Remove redundant newlines
      https://github.com/kvm-x86/linux/commit/a38125f188c1
[5/5] KVM: selftests: x86_64: Remove redundant newlines
      https://github.com/kvm-x86/linux/commit/65612e993493

--
https://github.com/kvm-x86/linux/tree/next

