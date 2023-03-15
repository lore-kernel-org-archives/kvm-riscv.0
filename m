From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 15 Mar 2023 09:53:56 +0100
Subject: [PATCH v6 0/8] RISC-V: Apply Zicboz to clear_page
In-Reply-To: <mhng-72607fed-a923-4921-896f-7f703434083a@palmer-ri-x1c9a>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
 <mhng-72607fed-a923-4921-896f-7f703434083a@palmer-ri-x1c9a>
Message-ID: <20230315085356.zlmiz5qkz44d5ndf@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 14, 2023 at 09:35:09PM -0700, Palmer Dabbelt wrote:
> On Fri, 24 Feb 2023 08:26:23 PST (-0800), ajones at ventanamicro.com wrote:
> > When the Zicboz extension is available we can more rapidly zero naturally
> > aligned Zicboz block sized chunks of memory. As pages are always page
> 
> I guess we're sort of in a grey area here: this is just a performance thing
> so in theory some sort of benchmark should be required, but IMO it's OK to
> just hand wave this one away -- if the "zero a cache block" instruction
> doesn't make "zero a page" go faster then something has gone so far off the
> rails it's probably better to just pretend the machine doesn't implement
> Zicboz.
> 
> This all LGTM, so unless anyone's opposed or it blows up on testing
> overnight then it'll be on for-next.

Thanks, Palmer!

drew

