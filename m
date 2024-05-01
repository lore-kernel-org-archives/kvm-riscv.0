From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 May 2024 10:32:48 +0100
Subject: [PATCH v4 03/11] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
In-Reply-To: <20240429150553.625165-4-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-4-cleger@rivosinc.com>
Message-ID: <20240501-waltz-choosy-59e08e6a1099@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 29, 2024 at 05:04:56PM +0200, Cl?ment L?ger wrote:
> The Zc* standard extension for code reduction introduces new extensions.
> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> are left out of this patch since they are targeting microcontrollers/
> embedded CPUs instead of application processors.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240501/61e94dad/attachment.sig>
