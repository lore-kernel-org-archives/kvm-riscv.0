From: Jason A. Donenfeld <Jason@zx2c4.com>
Date: Thu, 23 Mar 2023 16:56:24 +0100
Subject: [PATCH] riscv: require alternatives framework when selecting FPU
 support
In-Reply-To: <af690061-f962-498e-b2df-d2e6119292cf@spud>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
 <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
 <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
 <af690061-f962-498e-b2df-d2e6119292cf@spud>
Message-ID: <ZBx2qFFiaRSyJubo@zx2c4.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 23, 2023 at 02:49:34PM +0000, Conor Dooley wrote:
> This would requiring picking up your patch Jason, but with an
> "if !XIP_KERNEL" added to the select.

So the risk of making this all work is that we wind up forgetting to add
`select alternatives if !xip` to various places that need it (fpu, kvm,
maybe others? future others?), because it appears to work, thanks to the
code in your patch.

But making it work is also probably a good thing, since we obviously
want the fpu and maybe other things to work on xip kernels.

So maybe we should get rid of the CONFIG_RISCV_ALTERNATIVES knob
entirely, making it "always enabled", and then conditonalize the
alternatives code to BUILD_BUG_ON when called with CONFIG_XIP_KERNEL=y.
Then, this build bug will get hit immediately by
riscv_has_extension_*(), which will then require your patch, which can
run in a `if (IS_ENABLED(XIP_KERNEL))` block or similar.

The result of that will be:
- !xip kernels properly use the fast riscv_has_extension_*() code and
  any alternatives code needed, since it's always selected.
- xip kernels get a BUILD_BUG_ON if they use any alternatives-based code
  that doesn't have a xip fallback yet.

What do you think of that approach?

A "lighter weight" version of that approach would be to just remove all of
the `select RISCV_ALTERNATIVES` lines, and instead make
RISCV_ALTERNATIVES specify `default !XIP_KERNEL`. That would more or
less amount to the above too, though with weirder error cases.

Jason

