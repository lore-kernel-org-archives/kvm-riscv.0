From: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Jan 2024 12:26:25 -0800
Subject: [PATCH 5/5] KVM: selftests: x86_64: Remove redundant newlines
In-Reply-To: <20231206170241.82801-12-ajones@ventanamicro.com>
References: <20231206170241.82801-7-ajones@ventanamicro.com> <20231206170241.82801-12-ajones@ventanamicro.com>
Message-ID: <ZblbcUloeMqc-lR0@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 06, 2023, Andrew Jones wrote:
> @@ -162,7 +162,7 @@ static void check_clocksource(void)
>  		goto out;
>  	}
>  
> -	TEST_ASSERT(!strncmp(clk_name, "tsc\n", st.st_size),
> +	TEST_ASSERT(!strncmp(clk_name, "tsc", st.st_size),

This newline is functionally necessary.  It's in the strncmp() (*#$@ sysfs appends
newlines to everything), not the TEST_ASSERT message.  I'll give you a pass and
fixup when applying since I'm guessing you don't have x86 hardware ;-)

I double checked the other arch patches and didn't see anything sneaky like this.

