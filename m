Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FA1CA0EF5
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 01:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iz3XVih7K074Jcsvys9FODAjcdt3Xei55swQIqButNY=; b=3fBPXgE9gBMJeF
	rj100NHeizwhQoy1MPDSK9XEIF+fOB6LN/Ix4Nd1Z/sdSzl+EN3LVviKVGLQvQQ5WvdSn2LEp7PrX
	hOho0NFA5iCCXdeCtc0MjPtGihDn3/80cdMZObIG440LpLV/7KfjarKVq5JsE82RYBwFp1IzaiSfq
	Jee6o2okeUIgnu6hGfKKTqp1kA4eN5SlIry2vPK0oktEGfPHLUUFjbVttnXGzkpeZtLPkNFw4yE9B
	1ZLeAeJygqADBCTYRxE28SGSCwhaWCd5Pk1xx+GaBBYbpWD1Q238ZD5dXfN2iFZmH7XJMrELWnctQ
	xDVhJgoQDkinky0BPPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAzo-000000094KC-0rIa;
	Tue, 19 Aug 2025 01:18:40 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAzk-000000094Ii-0ouT;
	Tue, 19 Aug 2025 01:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755566270;
	bh=g6JjCoyupLN35z2qvVI8PUyBR1aUVsz84r9rhHKnBG8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=fBdEdbfEtSE3GETmB1e3uL6fxPX8AdUXXyzEFslWrIE5xOZSmIqzUSEEaIdoDCsJu
	 bNRzR5ogWHWYPrrRnMw4IBX0DLWPgv94P/V64TFmA8/sXkKJd9zzGkqRzrRLtHJG+Y
	 3sscIuOVfSW0DKRV2ad2Ayq5HLp7PlhXT9+7deoM=
X-QQ-mid: esmtpgz12t1755566262td4c8f477
X-QQ-Originating-IP: 9iDyEPMT2fIW1OmOGvQwzxzUT/TRlHh13QLu2xmmxSI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 19 Aug 2025 09:17:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15089458960345209029
EX-QQ-RecipientCnt: 11
Date: Tue, 19 Aug 2025 09:17:40 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: zhouquan@iscas.ac.cn, anup@brainfault.org, ajones@ventanamicro.com,
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2 1/6] RISC-V: KVM: Change zicbom/zicboz block size to
 depend on the host isa
Message-ID: <A0B6F37B4275250B+aKPQtDahHgv7Gq6-@LT-Guozexi>
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
 <fef5907425455ecd41b224e0093f1b6bc4067138.1754646071.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fef5907425455ecd41b224e0093f1b6bc4067138.1754646071.git.zhouquan@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NI6mNDRHoM9V6UIO0PANqbhBtmIzyi4VxG6uMub6K4uOxD+OaXdF6e+B
	9vdJ7VKtMnuyImz1jxJ6MOydSP6mXnrxf3H4Vm3yR/+FJiwvBM8pbjdW+Wo3pYZg7R+SoCm
	q3Wu93qEbUXAeamdfbJyaDUvvayU/dCz9BFfVYuh+x2YvoiWrDBMU9AWNbhbMIL7HBP4a9u
	ZYA1QJ87l6g82ay2HrJXxO4jtZB6Kw/dzQ8SU2S0gELoocuodX9hQ9KxOFD/mq9wcaX7eNe
	YRaRDHTFJ9E/JG1+XZumDmGPKt0O0vGMIbFk6Fr0DxiD81SX3IvZiwOGx9+ApNQYhQMAEDr
	j9jBMO5N9lS61PH1aWhTj7JECUDy+pszHDPB1t3hSfro8MckFJMh2yXo7vfVxKrm25V6Itq
	dZp1Ckd6vxyhVK7fBL4EzR+iBeJivThc/X7NGkUwmC/rN/OkUkYXDFJkLIuZBMl9MPcGxjX
	bWBxNcduBW+rePJRv8oSYG1nTvTgelS0mFs63Efkq7Y0SZWN0vJc4AKrbPKPK25Q2BPk+B4
	Fm2B6iTsbSL9cfSFLaHTGha8lXt+mVp+3udorSnmo54espk6KXe7azqkJDKOBbiOIublfEi
	kXkwCWMpMAR1JDow2Cx/sELL1K/Wjjaq4dx7qdLGuAEclTisAwYIfuYRCUHScaI//9gHhRA
	6svuHzrvBWJvnDiTMEwEuzwnNQDnvZYz4OhqQWl5x35PVqra9AixV89WH+jxbQasYrmu3Bx
	o9IjTadJbWZXiOx45H/g+Jc2lsdil3WfbhaVVZuKFXROJPflTAjP0NyPuju5AyIaFt18t/U
	4eS9bv7WLM3jEBsKBU5jkTzBnyJq04PDTXLX20fr8AZXmnqBLamCFJaR0X6KfDAvHejCL/E
	Ccu760ETi54XeGDNmaqdP5/G6vf8FmLNwyJKTkZclaAaOfccrkR7rqsqX1CZRHYyWXZFi57
	RASEr2GK28SVsWiC1qSPl1IY5Mseb2KUJtYCnlmOypVPCtz/YasFmGRGaR9aQUWGUMoSyFT
	OM9fTDvFYwjVIes/TLRo+5aVdzsRxYApGzZi2tzFFBhSEtqUHq
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_181836_970451_732E9D1A 
X-CRM114-Status: GOOD (  19.10  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 08, 2025 at 06:18:21PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The zicbom/zicboz block size registers should depend on the host's isa,
> the reason is that we otherwise create an ioctl order dependency on the VMM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
Reviwed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Best regards,
Troy
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index cce6a38ea54f..6bd64ae17b80 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -277,12 +277,12 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>  		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
>  		break;
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> -		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
> +		if (!riscv_isa_extension_available(NULL, ZICBOM))
>  			return -ENOENT;
>  		reg_val = riscv_cbom_block_size;
>  		break;
>  	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
> -		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
> +		if (!riscv_isa_extension_available(NULL, ZICBOZ))
>  			return -ENOENT;
>  		reg_val = riscv_cboz_block_size;
>  		break;
> @@ -366,13 +366,13 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  		}
>  		break;
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> -		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
> +		if (!riscv_isa_extension_available(NULL, ZICBOM))
>  			return -ENOENT;
>  		if (reg_val != riscv_cbom_block_size)
>  			return -EINVAL;
>  		break;
>  	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
> -		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
> +		if (!riscv_isa_extension_available(NULL, ZICBOZ))
>  			return -ENOENT;
>  		if (reg_val != riscv_cboz_block_size)
>  			return -EINVAL;
> @@ -817,10 +817,10 @@ static int copy_config_reg_indices(const struct kvm_vcpu *vcpu,
>  		 * was not available.
>  		 */
>  		if (i == KVM_REG_RISCV_CONFIG_REG(zicbom_block_size) &&
> -			!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
> +			!riscv_isa_extension_available(NULL, ZICBOM))
>  			continue;
>  		else if (i == KVM_REG_RISCV_CONFIG_REG(zicboz_block_size) &&
> -			!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
> +			!riscv_isa_extension_available(NULL, ZICBOZ))
>  			continue;
>  
>  		size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
