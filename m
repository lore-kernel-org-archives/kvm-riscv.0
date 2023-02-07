From: Vineet Gupta <vineetg@rivosinc.com>
Date: Tue, 7 Feb 2023 13:18:52 -0800
Subject: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
In-Reply-To: <20230125142056.18356-11-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
Message-ID: <91cd3bf5-9c68-df1e-32a8-55f2cfedd84a@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andy,

On 1/25/23 06:20, Andy Chiu wrote:
> +static bool insn_is_vector(u32 insn_buf)
> +{
> +	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
> +	/*
> +	 * All V-related instructions, including CSR operations are 4-Byte. So,
> +	 * do not handle if the instruction length is not 4-Byte.
> +	 */
> +	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
> +		return false;
> +	if (opcode == OPCODE_VECTOR) {
> +		return true;
> +	} else if (opcode == OPCODE_LOADFP || opcode == OPCODE_STOREFP) {
> +		u32 width = EXTRACT_LOAD_STORE_FP_WIDTH(insn_buf);
> +
> +		if (width == LSFP_WIDTH_RVV_8 || width == LSFP_WIDTH_RVV_16 ||
> +		    width == LSFP_WIDTH_RVV_32 || width == LSFP_WIDTH_RVV_64)
> +			return true;

What is the purpose of checking FP opcodes here ?

> +	} else if (opcode == RVG_OPCODE_SYSTEM) {
> +		u32 csr = EXTRACT_SYSTEM_CSR(insn_buf);
> +
> +		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
> +		    (csr >= CSR_VL && csr <= CSR_VLENB))
> +			return true;
> +	}
> +	return false;
> +}


