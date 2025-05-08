Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5C7C3ABC0
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLn8TWakPzxE6k9/RSJ3FUZHXUHuY2S7E0GZd77HIzU=; b=1VEFK8ajpAiixY
	th81E2lZ9IBPpNCSGXm16pkhqPmowIRzxSn0z4mVqZ5cjyz2MjJkAsmIepKqMnKyVE2r7jHM4NfBH
	8yq0fQBO0cs4gZdQAg0fephy6IiXy4x9GF5LbWvcDujTs7UhTZMPpeux4O/UNgzdPmlpbWjSgjqQs
	d28fBXX5UXe6hadh8DBi+k7ppEZdz0hwiKiU+odiRPNTaUdRFJzo9i5ejo6A9ILOTuQ/Lhj7NSAa5
	AVa9s1E2lmJdigAZfgZ5pAoXM5c9Xd04S6NycKMXx1ei7Nr9BHp/xOVBabAg4tiMCyLKRqfuVZq/9
	j8tnLlVjQ0+otHFl/R9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD27i-00000000tmQ-0AAL;
	Thu, 08 May 2025 14:21:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1MV-00000000lA1-0EIg
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 13:32:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso384125e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 08 May 2025 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746711149; x=1747315949; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ctop9M+S6pXp/ivb7RmdzyIsAM5dZO8eB9pvvIkCEbM=;
        b=ZcXIvPO0BnaOIGChIhid9UCEEE7wrJ2ophP5QqaVpOV58522scDSD4OBVRPOUovoXk
         /xPBfnWLVOnbM8w7NHpiEz8oPUHLFUqWjZJNrAPl8vZqxk+blqg2SHm2qm9fU16bQj4k
         6agB2NB00qAS5g0l2GpuvEXTlYuytd7AznOyAcmAEJy1SEobbci+/NPCH5LpUt0eJLpn
         tnQK4tBn21zagYKC0fDAc+sN1+u3YVcPmRgYNmeG6QrWrK2CMSPfX8HmSbPstSpYprqC
         SB0uYyL3739daHrHsgcykZgLR5iaEO828Kg89/Z6dlHU0/L/9sAAPAMM4pvMAn1lBNV6
         scNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711149; x=1747315949;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ctop9M+S6pXp/ivb7RmdzyIsAM5dZO8eB9pvvIkCEbM=;
        b=O8zeNrZM5hXWdPdLMrdey9AnQoJ1+U0ZTQQfpQ9pms9HvwDbbA6W6sR5i1Gpd8eQlu
         keyc4qhgSdpm/7mUy84etOpV1g5Yq9tG6p9CRfrXpF50tVMjQ5E7rBkhD+JQqgzsuvOG
         cnWChGreSPVt5I2BeVl+al+2jkLOgD7vzI0b+r9E683RwquPIYgmEKIkC9zvsXEgMxsR
         F0aCL5+zcaFWtXdvUXYKwI4UbLIxxxmK4FdwdKgmIHecIFYScKcG6ohq677oPnUmv6mf
         lwkkaoKBW37RQ2FpvS5uV2b2PYCPrZsA/gqPWSwCcaJPRJ7K7CfMYjj/d6O+8FDJz9Ex
         TP+A==
X-Forwarded-Encrypted: i=1; AJvYcCUrGE7nhNlX+KEZoZr7gatFUB6CjjOJz2mvaNk3vtHE62cxlGt/8hOtP0CGzNboRAHhCJ4QWsL49r4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywoz+vbxywRcjqEn/0X6fIZ+UWVchkPvjqZ2wAW7CzYMDYTIOmS
	z4H2O+i74chdqFXdhoOicV2V9+o5EwW8Be7b1zarnGoRoQovRpHB50bko/CXa9U=
X-Gm-Gg: ASbGncsbavyhfa9dgI8SXq6hEDa6PQgnAHJK3+164/wVV6g0UPmyGDqkO8thiNqDmO/
	HLlkqklA7oLbgSWDf/e9S99RgENkTTQdds4GfZU7ssboxa7FP7vmhfK9fsx8NWm25AVgDaw5LiS
	RlhTJAqYr6a17cy3qJbWuniA/AEft60Mf96cfLfl6BqqJZdWveE3QsAXqmLQTA16xh7ag/bO7Cr
	mwat4hY1GV4+JwGLlLrbSD1QdNFSbvVP8aaeCdH+dPNEwQKOrM/s1Mh8ooX4DWl4a/P3B7jMhjJ
	EjF8olft1O3zarUqUpqWg8EGIPOGaFaLKGkDH/bqGYQhRKJg
X-Google-Smtp-Source: AGHT+IFV8Gdwh/t9ZunwZV8yC9Gjd4YDqTg8K4dFRuyEe/kGcOgQumaKBu9osZaWckRfANKTr0Qn6g==
X-Received: by 2002:a05:600c:cca:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-441d44e57d6mr24537645e9.6.1746711149535;
        Thu, 08 May 2025 06:32:29 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32b0c8sm37984755e9.3.2025.05.08.06.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:32:26 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 May 2025 15:32:25 +0200
Message-Id: <D9QTFAE7R84D.2V08QTHORJTAH@ventanamicro.com>
Subject: Re: [PATCH 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_063231_099158_A3A090C9 
X-CRM114-Status: GOOD (  15.21  )
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

2025-05-05T14:39:29-07:00, Atish Patra <atishp@rivosinc.com>:
> SENVCFG and SSTATEEN CSRs are controlled by HSENVCFG(62) and
> SSTATEEN0(63) bits in hstateen. Enable them lazily at runtime
> instead of bootime.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> @@ -256,9 +256,37 @@ int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_
>  	return KVM_INSN_CONTINUE_SAME_SEPC;
>  }
>  
> +static int kvm_riscv_vcpu_hstateen_enable_senvcfg(struct kvm_vcpu *vcpu,
> +						  unsigned int csr_num,
> +						  unsigned long *val,
> +						  unsigned long new_val,
> +						  unsigned long wr_mask)
> +{
> +	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_HSENVCFG);
> +}

Basically the same comments as for [1/5]:

Why don't we want to set the ENVCFG bit (62) unconditionally?

It would save us the trap on first access.  We don't get anything from
the trap, so it looks like a net negative to me.

> +
> +static int kvm_riscv_vcpu_hstateen_enable_stateen(struct kvm_vcpu *vcpu,
> +						  unsigned int csr_num,
> +						  unsigned long *val,
> +						  unsigned long new_val,
> +						  unsigned long wr_mask)
> +{
> +	const unsigned long *isa = vcpu->arch.isa;
> +
> +	if (riscv_isa_extension_available(isa, SMSTATEEN))
> +		return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_SSTATEEN0);
> +	else
> +		return KVM_INSN_EXIT_TO_USER_SPACE;
> +}

The same argument applies to the SE0 bit (63) when the guest has the
sstateen extension.

KVM doesn't want to do anything other than stop trapping and reenter, so
it seems to me we could just not trap in the first place.

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
