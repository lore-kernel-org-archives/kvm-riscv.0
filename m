From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 6 Dec 2023 18:07:37 +0100
Subject: [PATCH 0/5] KVM: selftests: Remove redundant newlines
In-Reply-To: <20231206170241.82801-7-ajones@ventanamicro.com>
References: <20231206170241.82801-7-ajones@ventanamicro.com>
Message-ID: <20231206-6c869e5bc8ddf3b93e5b6fd6@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 06, 2023 at 06:02:42PM +0100, Andrew Jones wrote:
> This series has a lot of churn for dubious value, but I'm posting it
> anyway since I've already done the work. Each patch in the series is
> simply removing trailing newlines from format strings in TEST_* function
> callsites, since TEST_* functions append their own. The first patch
> addresses common lib and test code, the rest of the changes are split
> by arch in the remaining patches.
> 
> Figuring out which newlines to delete was done with a long, ugly
> grep regular expression[*] and then highlighting '\n' in the output
> and manually skimming to find, and then manually fix, each instance.
> I'm sure there's some AI tool that would have done everything for me,
> but this was my chance to prove I'm still as capable as AI (well,
> unless I missed some...)
> 
> [*] grep -rn . tools/testing/selftests/kvm |
>     grep -Pzo '(?s)\n[^\n]*TEST_(ASSERT|REQUIRE|FAIL)\(.*?\)\s*;' |
>     tr '\0' '\n'
> 
> 
> Andrew Jones (5):
>   KVM: selftests: Remove redundant newlines
>   KVM: selftests: aarch64: Remove redundant newlines
>   KVM: selftests: riscv: Remove redundant newlines
>   KVM: selftests: s390x: Remove redundant newlines
>   KVM: selftests: x86_64: Remove redundant newlines
>

I forgot to mention that this series is based on kvm-x86/selftests.

Thanks,
drew

