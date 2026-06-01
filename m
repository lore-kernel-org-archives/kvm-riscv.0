Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F009CD6E56
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s50zCurEBHNpTjMiQWbCdH91ONaEq6MaiAl6tmp1ebg=; b=ud0yQlPRJWUds5
	gaZfSdDvDR5QFi5Xwzkr5mx1rnIR9PunWlRhJJ6+C3NHbdQmL7oLg9h2B30r8kQsmo3jNTbnaNyz8
	e48IU5f9nnPIMNp+DMxuo+MwBEuwXSK/DnFZTWrlDrsjYcnohtIhp0F45AWbryE+i9NC7iLc6+ZEl
	GGFafKiOnzPY6vo1x5KqA/L0WcN4OVRRsb2EDaiGyAajui1OQJ+I7p55wLzTZHkziBUtLFwJIcm/l
	7OQa1b1ZwlWBtcvCHVDIf2odzGQRk8HFChjioYCv9/B0P2iv3TU0pKs0VHWKvOhOzca8G3w9jNOQ2
	I9CUpYdAZHM6HaTzZV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0d6-0000000AiRB-1BoZ;
	Mon, 01 Jun 2026 11:16:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0d4-0000000AiQ3-2UE7
	for kvm-riscv@bombadil.infradead.org;
	Mon, 01 Jun 2026 11:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A0RvTxX98K/pUu8wDZcU84mvng4xT6uAwNgRwaMuMuo=; b=nyz9W7Gbvo1/sCSMrlkBMm56MK
	42yyxHY7HUBP8Esfgl8HXfA8If/k+WxLPuWvzOwYL2M/YJ9JM9NOaW3bEYBktCpqV8xOKxl/irvar
	5Wz6Za9hizqK19Ea35yxnnwsw9rZqrk1o9OH77bsU2crqWlhen0dq4GVn8jFnSZwafmM+IX1EjCtD
	5seOWIvFa+nsp/7OtpwCsxrzAa9IQ4VWGvEIECety+ohsYlRJtSOjtYZNbIkcK5WSUV2yL3/IWzkD
	+51UeApccCL7LVqL58LEMi8oCldw9yNx7r7gEWQE3jL7tgssYXxWLjQE+e3Db0SxPSUcLVEuJvmiP
	RDDJFO1Q==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0d1-00000006VW9-1HmY
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 11:16:21 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so432037a91.2
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 04:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780312577; x=1780917377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A0RvTxX98K/pUu8wDZcU84mvng4xT6uAwNgRwaMuMuo=;
        b=V4u81qKDVEx1mOMTRZLsHcW9uyTmcSrYP73qHXF0eOCEqokqVj625NCFIaXHd2/zs8
         zdZdMxmNfNSZ2F5d8DhN7zbICYin+3MYGAPZeIizhhcXFk5ffmtq/yuEyVuBHFYoczap
         P5EQAbsya+OwONdTsP/MzhevrgPMsOON7KBUJX6anH+M1xZGtUSNG5Sn/mOHjxRNl1B9
         VP0mjcV8M0yXaq1hMOEttp+mBbNfKH5rYr4x5l9eKe3szhz0ZhOa8/4YMLRum08apHSs
         3MMgrXM7ZmqXKru8lcMvboa0jzPGfJjKM+sZ+ddIk0mc1k08mK3b4/lDOzrvKX9ICdwr
         5bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312577; x=1780917377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0RvTxX98K/pUu8wDZcU84mvng4xT6uAwNgRwaMuMuo=;
        b=Lm2gYYA9IFJYEPZRECovdkpvkD3f57w9sfD54aKvOOAjyw2YNczrYjHGFYo1M/1A7Z
         KM06BcxBXiUvD/+aXlU2JWnshgtdpW3yPfpklDdpcD3B7LdxriDEEeKlLjnto+6n5PCW
         Q06db1tBibrdytaIW1rWhu+FPVn6iNz2LDFgjc4HQzMHlsZfmQqK1wamfIgskrN64txk
         3tMO9yyej+0oPBKFY8zgomsU3Tkvhuc35ZfRpZUEHf66fNL0HfYsOwwaDZCX8RcsDvJI
         5hOaQqWazc9fw7eUdUMgPE6ogE6+CqYtuLl9jbo3ctaxwXTlBg3zuGfWhlawbzpSKYP+
         addQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vLU/mMUoH4UjvWr0qwxX2Q4v5rNuA+M2go+lCCL+DHglPJ+NxKZeQmvUA+gZvfXS1WQQHRxlFpwk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPi/84Rj8tmlgo5PN063uVtc7a0bAjTcCFy0ndixOFG32Ov3zH
	iTfIBM3sy2TMKLckR0ShGjOT2VYT1jEIWOlhitygXo/pUVh/LZOH6Uso
X-Gm-Gg: Acq92OG7xOSEg0naQCkCE19IbDkC9xTGpO+IxSA/0s54/JnfSrlJH91lSoLeLelPrsd
	z561XR4Dab3RQkOOwCraDvO7uzpBYQVRYVRBKR8QuqESsPRoc356Z1VxFRmO+MGQfP1hyjMokHt
	s08ctDgK+wknheYJKlC0rXjbY2hAXgCwg9NPTQVUxVJ9QU7odVQNw2LCp1o9HyxHnfWFo9H6s+m
	QYD8x+o6t1eGBiq2rmgccLHtweIlJgqlEBD17zRxNnhgPO/Xg1R/M83Iqayrl4b4KxjqYTChr4t
	9zdBeHWBeGDBQZyGWF4NUaVACjZ/cEx0oWO6AjigEnUVWtUeiVvwLejZ/NSxkZBpMjDM39iP1Tv
	0p/nWL6pz+uIVsaOgZsqlZaEZbFYe4T1wemqgcO+EqW7b9z7JhRP7Pzbaug/0ZTSSa+0efQr3Xn
	SyI4IPqOt+DHD/n9szJfTWNWCW8xXmCdg42A==
X-Received: by 2002:a17:90a:d403:b0:36d:649a:39f7 with SMTP id 98e67ed59e1d1-36d649a3a91mr8902054a91.22.1780312576930;
        Mon, 01 Jun 2026 04:16:16 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc660da67sm10402142a91.6.2026.06.01.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:16:16 -0700 (PDT)
Date: Mon, 1 Jun 2026 19:16:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for
 Guest/VM
Message-ID: <ah1pgb4S-UoSWhC_@inochi.infowork>
References: <20260601084336.2601675-1-inochiama@gmail.com>
 <20260601084336.2601675-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260601084336.2601675-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_121619_740001_F33D2491 
X-CRM114-Status: GOOD (  17.31  )
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

On Mon, Jun 01, 2026 at 04:43:32PM +0800, Inochi Amaoto wrote:
> Extend the KVM ISA extension array to allow KVM userspace to
> detect and enable Zicfiss/Zicfilp extensions for Guest/VM.
> 
> Assisted-by: YuanSheng:claude-4.7-opus
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/isa.c              | 2 ++
>  2 files changed, 4 insertions(+)
> 

I have forgot to add CSR_SSP to the context, will add in the next
version. But I have a small question for it: could I reuse the 
generic subtype or use a new CSR subtype?

Regards,
Inochi

> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 501e4fc60dd2..9f9c5ababd1e 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZCLSD,
>  	KVM_RISCV_ISA_EXT_ZILSD,
>  	KVM_RISCV_ISA_EXT_ZALASR,
> +	KVM_RISCV_ISA_EXT_ZICFILP,
> +	KVM_RISCV_ISA_EXT_ZICFISS,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
> index 1132d909cc25..9852a91fdecc 100644
> --- a/arch/riscv/kvm/isa.c
> +++ b/arch/riscv/kvm/isa.c
> @@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZICBOP),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
>  	KVM_ISA_EXT_ARR(ZICCRSE),
> +	KVM_ISA_EXT_ARR(ZICFILP),
> +	KVM_ISA_EXT_ARR(ZICFISS),
>  	KVM_ISA_EXT_ARR(ZICNTR),
>  	KVM_ISA_EXT_ARR(ZICOND),
>  	KVM_ISA_EXT_ARR(ZICSR),
> -- 
> 2.54.0
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
