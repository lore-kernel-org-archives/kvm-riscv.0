Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE2FC369D9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbhnC1FJzvY+VFGXvZuDRj+Ymypk0v2e5E6Jm+fLrVE=; b=GznsBu5qfi67R5
	g9rnGtraYUCtAYaQ7wqKDyC7cwjPumFotiN3pVKVytDNG1FGtk3Y90qWFJ8aMFbhTlBFB5Z0g+J4A
	RU6zxl81fI9oXeSsGU3wrrbxyv78I0tlyZI18tlBvsHmCG8bpdDMSSb0Oxez2uJjvUPteT7Mpf8QL
	N3KCWQYjznxkOBvR3u2l2ZVWhxdnv3VpWprtM+cndUJuUjCo2abQFcbnNFmBAfjVt7bOoZzrYnMh9
	/S9ibt5kFqaRfaw7AZczDKh5HpIdzYS8HgXL3GpYjS+ez6u5H2ks3+OpD01fS1msdkhOwfFMo1R3e
	3ujVJEHnxki14+rLAi3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1w6-0000000C084-20BY;
	Wed, 30 Apr 2025 07:32:54 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1hR-0000000BxmS-1zp9
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 07:17:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso54196975e9.0
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 00:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745997464; x=1746602264; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PqjMzS+FBLFDbJOKny7GrnZTBzhH+u7uuqqUQc9EHRM=;
        b=YjXtkhI1bogOh8JWXqBMNoqR4wsn36NkhRzsHU7UXjGr/7kENmLjvYUsKeit5J9XSK
         vOq1Z/I6aOJLXHFa72blj68zbqkcIZ+Vda+M9J74lidhuiKly7FJ1jyqEnUhyO0FHyU8
         wU6h9i2u4V+1gU1aq/If/l+tW8NSgfmtzScxwDgfotUYZTxtEEkPplfPcoOEPEvTxWkQ
         ehIg/mSBImAiy7CknCaMUahdfh0mbStvr9Lg+O8QAVfRzMj/cepRiCUMaujpKLhYKJIn
         vUEANu6ItJAxOdzaLS3aDJ6NC75HmFmtdUeHSCdI41N57xX2Le2pCW7oxjndrw6WqEXz
         fFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745997464; x=1746602264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqjMzS+FBLFDbJOKny7GrnZTBzhH+u7uuqqUQc9EHRM=;
        b=EQzpXRAITae+5UcugSxXeqhZwnV/sKZpuc9Xa5F8mlGExrqVj9Vdx8i++CyOeq7j/j
         2i7BS6tmCSAi57VhC2I7LqBs1wZ9Vuwr7r5y3UBZfKPlp+IMuP6ChSnP1lmvsf/7HoXX
         +Kdpgjiu80LX7jX835Su0gddcz5ZmK8IckcD6FRE0OfYXPdrTn+eutyy3YqR/1EKsU8/
         JMMDEiUUyEjTmuDXRq2aWOXlFyazdSEjcrOMyTp0fhfUA+82J2pZskUmpAmux18uHHTx
         rpi9qA3RYo1RikO3bVeWuuNHzIptKTxiIWq6eTm4ejyE5b287fGe7mYqlv7ihSaApEqv
         FyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoMP9vx+UP80K0bKsZePxdAJkDCwOSaPibiUd/6vc1/j2Tkn5S15Txddt16ITr7shxCiFh+BFTmEo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwM+7ZJAAVBDyoBoysyKlwHPCVHXRyUr8H9RaaSv0oHcJ5EXQIh
	PghLxrvOK7ARpImdGixHtZvjnbVrUfB540A4bVrP2Kgjz3CCUg6RAKYXfHBpmAM=
X-Gm-Gg: ASbGncuY4F57x1jeB0w9sMgKcvEGQRnA8q6xb2m1iDXUng2BvmiEoHbss0Jk0IY9q1P
	Q5YP5+4QQc2U0QwFVCK0JDlNfYclap24lPxDKNtOMqxjqvt7XJvOW8brqjZkEIrrJeoGv6p6AiH
	Xv6EG34wk/MI75WAD7X6onrKVALystTsItbNXHqZDUp6WDTWzWoUciKA5NQaDboLwcIHc1E1nUZ
	9a/XEqi6mjuXQ3jPlOnWbw4MY/kfpnhXNBr0TsxHsoCtjuZTTn8m3lkCi3p1Rm3Mqfgyd6WSCvs
	wnRib65Z7+iQxlh07HqZvQCB4Kjh
X-Google-Smtp-Source: AGHT+IHtgj/ABX+JTsVARbFBcPKRaC7E9f5ujgDo1Blvpy5YFtt2KpZ0159WrOxKnfdgH6Xy9VmzgA==
X-Received: by 2002:a5d:64c8:0:b0:3a0:7af3:be8f with SMTP id ffacd0b85a97d-3a08f7538eamr1752343f8f.5.1745997463700;
        Wed, 30 Apr 2025 00:17:43 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46a54sm16427127f8f.67.2025.04.30.00.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:17:43 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:17:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] KVM: riscv: selftests: Add vector extension tests
Message-ID: <20250430-4790c7c3ea3623243f2d22ac@orel>
References: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
 <20250429-kvm_selftest_improve-v2-3-51713f91e04a@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429-kvm_selftest_improve-v2-3-51713f91e04a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_001745_519609_1FE210DD 
X-CRM114-Status: GOOD (  29.07  )
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

On Tue, Apr 29, 2025 at 05:18:47PM -0700, Atish Patra wrote:
> Add vector related tests with the ISA extension standard template.
> However, the vector registers are bit tricky as the register length is
> variable based on vlenb value of the system. That's why the macros are
> defined with a default and overidden with actual value at runtime.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 133 +++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 569f2d67c9b8..814dd981ce0b 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -17,6 +17,15 @@ enum {
>  	VCPU_FEATURE_SBI_EXT,
>  };
>  
> +enum {
> +	KVM_RISC_V_REG_OFFSET_VSTART = 0,
> +	KVM_RISC_V_REG_OFFSET_VL,
> +	KVM_RISC_V_REG_OFFSET_VTYPE,
> +	KVM_RISC_V_REG_OFFSET_VCSR,
> +	KVM_RISC_V_REG_OFFSET_VLENB,
> +	KVM_RISC_V_REG_OFFSET_MAX,
> +};
> +
>  static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
>  
>  bool filter_reg(__u64 reg)
> @@ -143,6 +152,39 @@ bool check_reject_set(int err)
>  	return err == EINVAL;
>  }
>  
> +static int override_vector_reg_size(struct kvm_vcpu *vcpu, struct vcpu_reg_sublist *s,
> +				    uint64_t feature)
> +{
> +	unsigned long vlenb_reg = 0;
> +	int rc;
> +	u64 reg, size;
> +
> +	/* Enable V extension so that we can get the vlenb register */
> +	rc = __vcpu_set_reg(vcpu, feature, 1);
> +	if (rc)
> +		return rc;
> +
> +	__vcpu_get_reg(vcpu, s->regs[KVM_RISC_V_REG_OFFSET_VLENB], &vlenb_reg);

We can remove the underscores from this call since it shouldn't fail, as
we know we've successfully enabled the V extension at this point.

> +
> +	if (!vlenb_reg) {
> +		TEST_FAIL("Can't compute vector register size from zero vlenb\n");
> +		return -EPERM;
> +	}
> +
> +	size = __builtin_ctzl(vlenb_reg);
> +	size <<= KVM_REG_SIZE_SHIFT;
> +
> +	for (int i = 0; i < 32; i++) {
> +		reg = KVM_REG_RISCV | KVM_REG_RISCV_VECTOR | size | KVM_REG_RISCV_VECTOR_REG(i);
> +		s->regs[KVM_RISC_V_REG_OFFSET_MAX + i] = reg;
> +	}
> +
> +	/* We should assert if disabling failed here while enabling succeeded before */
> +	vcpu_set_reg(vcpu, feature, 0);
> +
> +	return 0;
> +}
> +
>  void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>  {
>  	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
> @@ -172,6 +214,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>  		if (!s->feature)
>  			continue;
>  
> +		if (s->feature == KVM_RISCV_ISA_EXT_V) {
> +			feature = RISCV_ISA_EXT_REG(s->feature);
> +			rc = override_vector_reg_size(vcpu, s, feature);
> +			if (rc)
> +				goto skip;
> +		}
> +
>  		switch (s->feature_type) {
>  		case VCPU_FEATURE_ISA_EXT:
>  			feature = RISCV_ISA_EXT_REG(s->feature);
> @@ -186,6 +235,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>  		/* Try to enable the desired extension */
>  		__vcpu_set_reg(vcpu, feature, 1);
>  
> +skip:
>  		/* Double check whether the desired extension was enabled */
>  		__TEST_REQUIRE(__vcpu_has_ext(vcpu, feature),
>  			       "%s not available, skipping tests", s->name);
> @@ -410,6 +460,35 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
>  	return strdup_printf("%lld /* UNKNOWN */", reg_off);
>  }
>  
> +static const char *vector_id_to_str(const char *prefix, __u64 id)
> +{
> +	/* reg_off is the offset into struct __riscv_v_ext_state */
> +	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_VECTOR);
> +	int reg_index = 0;
> +
> +	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_VECTOR);
> +
> +	if (reg_off >= KVM_REG_RISCV_VECTOR_REG(0))
> +		reg_index = reg_off -  KVM_REG_RISCV_VECTOR_REG(0);
> +	switch (reg_off) {
> +	case KVM_REG_RISCV_VECTOR_REG(0) ...
> +	     KVM_REG_RISCV_VECTOR_REG(31):
> +		return strdup_printf("KVM_REG_RISCV_VECTOR_REG(%d)", reg_index);
> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
> +		return "KVM_REG_RISCV_VECTOR_CSR_REG(vstart)";
> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
> +		return "KVM_REG_RISCV_VECTOR_CSR_REG(vl)";
> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
> +		return "KVM_REG_RISCV_VECTOR_CSR_REG(vtype)";
> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
> +		return "KVM_REG_RISCV_VECTOR_CSR_REG(vcsr)";
> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vlenb):
> +		return "KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)";
> +	}
> +
> +	return strdup_printf("%lld /* UNKNOWN */", reg_off);
> +}
> +
>  #define KVM_ISA_EXT_ARR(ext)		\
>  [KVM_RISCV_ISA_EXT_##ext] = "KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_" #ext
>  
> @@ -639,6 +718,9 @@ void print_reg(const char *prefix, __u64 id)
>  	case KVM_REG_SIZE_U128:
>  		reg_size = "KVM_REG_SIZE_U128";
>  		break;
> +	case KVM_REG_SIZE_U256:
> +		reg_size = "KVM_REG_SIZE_U256";
> +		break;
>  	default:
>  		printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) | 0x%llx /* UNKNOWN */,\n",
>  		       (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id & ~REG_MASK);
> @@ -670,6 +752,10 @@ void print_reg(const char *prefix, __u64 id)
>  		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_FP_D | %s,\n",
>  				reg_size, fp_d_id_to_str(prefix, id));
>  		break;
> +	case KVM_REG_RISCV_VECTOR:
> +		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_VECTOR | %s,\n",
> +		       reg_size, vector_id_to_str(prefix, id));
> +		break;
>  	case KVM_REG_RISCV_ISA_EXT:
>  		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_ISA_EXT | %s,\n",
>  				reg_size, isa_ext_id_to_str(prefix, id));
> @@ -874,6 +960,48 @@ static __u64 fp_d_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_D,
>  };
>  
> +/* Define a default vector registers with length. This will be overwritten at runtime */
> +static __u64 vector_regs[] = {
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vstart),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vl),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vtype),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vcsr),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vlenb),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(0),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(1),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(2),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(3),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(4),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(5),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(6),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(7),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(8),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(9),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(10),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(11),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(12),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(13),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(14),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(15),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(16),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(17),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(18),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(19),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(20),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(21),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(22),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(23),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(24),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(25),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(26),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(27),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(28),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(29),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(30),
> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(31),
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V,
> +};
> +
>  #define SUBLIST_BASE \
>  	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
>  	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
> @@ -898,6 +1026,9 @@ static __u64 fp_d_regs[] = {
>  	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
>  		.regs_n = ARRAY_SIZE(fp_d_regs),}
>  
> +#define SUBLIST_V \
> +	{"v", .feature = KVM_RISCV_ISA_EXT_V, .regs = vector_regs, .regs_n = ARRAY_SIZE(vector_regs),}
> +
>  #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
>  static __u64 regs_##ext[] = {					\
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
> @@ -966,6 +1097,7 @@ KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
>  KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
>  KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
>  KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
> +KVM_ISA_EXT_SUBLIST_CONFIG(v, V);
>  KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
>  KVM_ISA_EXT_SIMPLE_CONFIG(smnpm, SMNPM);
>  KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
> @@ -1040,6 +1172,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_fp_f,
>  	&config_fp_d,
>  	&config_h,
> +	&config_v,
>  	&config_smnpm,
>  	&config_smstateen,
>  	&config_sscofpmf,
> 
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
