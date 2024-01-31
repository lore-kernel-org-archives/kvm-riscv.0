From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 Jan 2024 09:49:40 +0100
Subject: [PATCH 5/5] KVM: selftests: x86_64: Remove redundant newlines
In-Reply-To: <ZblbcUloeMqc-lR0@google.com>
References: <20231206170241.82801-7-ajones@ventanamicro.com>
 <20231206170241.82801-12-ajones@ventanamicro.com>
 <ZblbcUloeMqc-lR0@google.com>
Message-ID: <20240131-aaad2df64c2f26b892623006@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 30, 2024 at 12:26:25PM -0800, Sean Christopherson wrote:
> On Wed, Dec 06, 2023, Andrew Jones wrote:
> > @@ -162,7 +162,7 @@ static void check_clocksource(void)
> >  		goto out;
> >  	}
> >  
> > -	TEST_ASSERT(!strncmp(clk_name, "tsc\n", st.st_size),
> > +	TEST_ASSERT(!strncmp(clk_name, "tsc", st.st_size),
> 
> This newline is functionally necessary.  It's in the strncmp() (*#$@ sysfs appends
> newlines to everything), not the TEST_ASSERT message.  I'll give you a pass and
> fixup when applying since I'm guessing you don't have x86 hardware ;-)

Thanks for the fixup!

> 
> I double checked the other arch patches and didn't see anything sneaky like this.

And for the double check!

drew

