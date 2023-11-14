From: Conor Dooley <conor@kernel.org>
Date: Tue, 14 Nov 2023 15:39:10 +0000
Subject: [PATCH v3 0/4] Add Svadu Extension Support
In-Reply-To: <20231102120129.11261-1-yongxuan.wang@sifive.com>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
Message-ID: <20231114-herald-cried-9122f8bbb218@squawk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 02, 2023 at 12:01:21PM +0000, Yong-Xuan Wang wrote:
> Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
> patch set adds support to enable Svadu extension for both host and guest
> OS.

From patch one onwards for rv32_defconfig:
  /tmp/tmp.TRw8gWHZCe/arch/riscv/include/asm/pgtable.h:636:9: error: call to undeclared function 'riscv_has_extension_unlikely'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  /tmp/tmp.TRw8gWHZCe/include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]

There seem to be quite a few of these -Warray-bounds issues, all in
code included from signal.h. Could you please do an rv32 build and fix
up these build issues?

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20231114/ad513c42/attachment.sig>
