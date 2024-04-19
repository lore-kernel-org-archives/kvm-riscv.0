From: Conor Dooley <conor@kernel.org>
Date: Fri, 19 Apr 2024 16:24:45 +0100
Subject: [PATCH v2 01/12] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb
 ISA extension description
In-Reply-To: <20240418124300.1387978-2-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-2-cleger@rivosinc.com>
Message-ID: <20240419-aground-extradite-9557a5b90afe@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 18, 2024 at 02:42:24PM +0200, Cl?ment L?ger wrote:
> Add description for Zca, Zcf, Zcd and Zcb extensions which are part the
> Zc* standard extensions for code size reduction. Additional validation
> rules are added since Zcb depends on Zca, Zcf, depends on Zca and F, Zcd
> depends on Zca and D and finally, Zcf can not be present on rv64.

> +allOf:
> +  # Zcf extension does not exists on rv64

If there's another version, "exist".
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240419/9490d193/attachment.sig>
