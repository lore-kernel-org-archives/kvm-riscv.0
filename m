Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AC3C369D5
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 00:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQaRwtfe7MyvfLWBgyz1yp0KS+V7pSmDJWK8mszIcaM=; b=4uRcdHb7gJzOt+
	dIFG6Fbb9di5WRiwdxHLw/GlW8gxu1mTNEN43BedzfmxMSELb9bF1CxByVDmvsOzlKZR1g+zAKTpC
	o1nK+FWJ0oOihrnP7q9PKh7gSLKEqct2zp2H57VQ9+JIkSUmgiX26qvj7rmlV5HmIYb4Nd5WhPWa0
	i1rOjUW/ZV1S4SpT3pTia/Y67UjglYZX9a9HRnT0TcqfsbkmmR/N2tDD5ajznNt6/r9DkOUTwDLGD
	4heYZ8w8anE9zRC6FSOi0j5CpORiEgSRf9gSO0+r4qfhUTDaww3iF5hhL3+ySRss0N7xoxzCvRRyk
	P5QK4h2P2XH3k4VfyyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Yti-00000007tgu-2gmg;
	Tue, 29 Apr 2025 00:32:30 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ytg-00000007tgC-1E3Y
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 00:32:29 +0000
Message-ID: <30b2d279-8459-4a72-aad4-29c1ece622b8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745886736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMdD3vES5bpU+wy7U7dBxDmOnHQWWw6FHBBe4F+no+Q=;
	b=xSqZFw8fHQ15CHKwURcoJYe3djPpqXdWQtBhK/gmbt8UlqfQRfGeG3ULvefmcbRI5qGjyU
	JC9mDV9KQsPspVwprMucTbH06Er73Ib2ZuOJi9a0c1I8woTdgAW/8sHF+ohGErY5f4of6Z
	5TCXZRa0ZAZgxnbeIiX4oDzGFS+Lmc4=
Date: Mon, 28 Apr 2025 17:32:09 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] KVM: riscv: selftests: Add vector extension tests
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-3-583620219d4f@rivosinc.com>
 <20250425-a2a40c6296018326cdcf7d24@orel>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250425-a2a40c6296018326cdcf7d24@orel>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_173228_477957_031812FF 
X-CRM114-Status: GOOD (  35.22  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


On 4/25/25 7:20 AM, Andrew Jones wrote:
> On Mon, Mar 24, 2025 at 05:40:31PM -0700, Atish Patra wrote:
>> Add vector related tests with the ISA extension standard template.
>> However, the vector registers are bit tricky as the register length is
>> variable based on vlenb value of the system. That's why the macros are
>> defined with a default and overidden with actual value at runtime.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   tools/testing/selftests/kvm/riscv/get-reg-list.c | 111 ++++++++++++++++++++++-
>>   1 file changed, 110 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
>> index 8515921dfdbf..576ab8eb7368 100644
>> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
>> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
>> @@ -145,7 +145,9 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>>   {
>>   	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
>>   	struct vcpu_reg_sublist *s;
>> -	uint64_t feature;
>> +	uint64_t feature = 0;
>> +	u64 reg, size;
>> +	unsigned long vlenb_reg;
>>   	int rc;
>>   
>>   	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
>> @@ -173,6 +175,23 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
>>   		switch (s->feature_type) {
>>   		case VCPU_FEATURE_ISA_EXT:
>>   			feature = RISCV_ISA_EXT_REG(s->feature);
>> +			if (s->feature == KVM_RISCV_ISA_EXT_V) {
>> +				/* Enable V extension so that we can get the vlenb register */
>> +				__vcpu_set_reg(vcpu, feature, 1);
> We probably want to bail here if __vcpu_set_reg returns an error.
>
Sure. What do you mean by bail here ?
Continue to the next reg or just assert if it returns error.


>> +				/* Compute the correct vector register size */
>> +				rc = __vcpu_get_reg(vcpu, s->regs[4], &vlenb_reg);
> I see regs[4] is the encoding for vlenb, but I think we need a comment or
> a define or something in order to reduce head scratching.
>
Sure. Defined a macro.


>> +				if (rc < 0)
>> +				/* The vector test may fail if the default reg size doesn't match */
> I guess this comment should be below the break. We could probably use some
> blank lines in this code too. But, more importantly, what does this
> comment mean? That things may not work despite what we're doing here? Or,
> I think it means that we're doing this just in case the default size we
> already have set doesn't match. Can we reword it?

It's the latter. I will try to reword it.

>> +					break;
>> +				size = __builtin_ctzl(vlenb_reg);
>> +				size <<= KVM_REG_SIZE_SHIFT;
>> +				for (int i = 0; i < 32; i++) {
>> +					reg = KVM_REG_RISCV | KVM_REG_RISCV_VECTOR | size |
>> +					      KVM_REG_RISCV_VECTOR_REG(i);
>> +					s->regs[5 + i] = reg;
>> +				}
>> +				__vcpu_set_reg(vcpu, feature, 0);
> Switch this to vcpu_set_reg() since we want to assert it worked.
Done.
>> +			}
> This if (s->feature == KVM_RISCV_ISA_EXT_V) block can go above the switch
> since it's not dependent on feature_type. I'd probably also create a
> function for it in order to keep finalize_vcpu() tidy and help with the
> indentation depth.
done.
>>   			break;
>>   		case VCPU_FEATURE_SBI_EXT:
>>   			feature = RISCV_SBI_EXT_REG(s->feature);
>> @@ -408,6 +427,35 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
>>   	return strdup_printf("%lld /* UNKNOWN */", reg_off);
>>   }
>>   
>> +static const char *vector_id_to_str(const char *prefix, __u64 id)
>> +{
>> +	/* reg_off is the offset into struct __riscv_v_ext_state */
>> +	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_VECTOR);
>> +	int reg_index = 0;
>> +
>> +	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_VECTOR);
>> +
>> +	if (reg_off >= KVM_REG_RISCV_VECTOR_REG(0))
>> +		reg_index = reg_off -  KVM_REG_RISCV_VECTOR_REG(0);
>> +	switch (reg_off) {
>> +	case KVM_REG_RISCV_VECTOR_REG(0) ...
>> +	     KVM_REG_RISCV_VECTOR_REG(31):
>> +		return strdup_printf("KVM_REG_RISCV_VECTOR_REG(%d)", reg_index);
>> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
>> +		return "KVM_REG_RISCV_VECTOR_CSR_REG(vstart)";
>> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
>> +		return "KVM_REG_RISCV_VECTOR_CSR_REG(vl)";
>> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
>> +		return "KVM_REG_RISCV_VECTOR_CSR_REG(vtype)";
>> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
>> +		return "KVM_RISCV_VCPU_VECTOR_CSR_REG(vcsr)";
>> +	case KVM_REG_RISCV_VECTOR_CSR_REG(vlenb):
>> +		return "KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)";
>> +	}
>> +
>> +	return strdup_printf("%lld /* UNKNOWN */", reg_off);
>> +}
>> +
>>   #define KVM_ISA_EXT_ARR(ext)		\
>>   [KVM_RISCV_ISA_EXT_##ext] = "KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_" #ext
>>   
>> @@ -635,6 +683,9 @@ void print_reg(const char *prefix, __u64 id)
>>   	case KVM_REG_SIZE_U128:
>>   		reg_size = "KVM_REG_SIZE_U128";
>>   		break;
>> +	case KVM_REG_SIZE_U256:
>> +		reg_size = "KVM_REG_SIZE_U256";
>> +		break;
>>   	default:
>>   		printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) | 0x%llx /* UNKNOWN */,\n",
>>   		       (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id & ~REG_MASK);
>> @@ -666,6 +717,10 @@ void print_reg(const char *prefix, __u64 id)
>>   		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_FP_D | %s,\n",
>>   				reg_size, fp_d_id_to_str(prefix, id));
>>   		break;
>> +	case KVM_REG_RISCV_VECTOR:
>> +		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_VECTOR | %s,\n",
>> +		       reg_size, vector_id_to_str(prefix, id));
>> +		break;
>>   	case KVM_REG_RISCV_ISA_EXT:
>>   		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_ISA_EXT | %s,\n",
>>   				reg_size, isa_ext_id_to_str(prefix, id));
>> @@ -870,6 +925,54 @@ static __u64 fp_d_regs[] = {
>>   	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_D,
>>   };
>>   
>> +/* Define a default vector registers with length. This will be overwritten at runtime */
>> +static __u64 vector_regs[] = {
>> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR |
>> +	KVM_REG_RISCV_VECTOR_CSR_REG(vstart),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR |
>> +	KVM_REG_RISCV_VECTOR_CSR_REG(vl),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR |
>> +	KVM_REG_RISCV_VECTOR_CSR_REG(vtype),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR |
>> +	KVM_REG_RISCV_VECTOR_CSR_REG(vcsr),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR |
>> +	KVM_REG_RISCV_VECTOR_CSR_REG(vlenb),
> Let these lines stick out to be easier to read and ensure one register
> encoding per line (we don't care about line length at all in this file :-)
>
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(0),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(1),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(2),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(3),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(4),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(5),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(6),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(7),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(8),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(9),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(10),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(11),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(12),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(13),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(14),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(15),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(16),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(17),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(18),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(19),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(20),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(21),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(22),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(23),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(24),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(25),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(26),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(27),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(28),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(29),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(30),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(31),
>> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
>> +	KVM_RISCV_ISA_EXT_V,
> should also stick out
>
>> +};
>> +
>>   #define SUBLIST_BASE \
>>   	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
>>   	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
>> @@ -894,6 +997,10 @@ static __u64 fp_d_regs[] = {
>>   	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
>>   		.regs_n = ARRAY_SIZE(fp_d_regs),}
>>   
>> +#define SUBLIST_V \
>> +	{"v", .feature = KVM_RISCV_ISA_EXT_V, .regs = vector_regs, \
>> +		.regs_n = ARRAY_SIZE(vector_regs),}
> I'd also let this stick out since it won't even be 100 chars.
>
It is actually little longer than 100 (103) but it is definitely more 
readable if it sticks out.
Fixed all the truncated lines.
>> +
>>   #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
>>   static __u64 regs_##ext[] = {					\
>>   	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
>> @@ -962,6 +1069,7 @@ KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
>>   KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
>>   KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
>>   KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
>> +KVM_ISA_EXT_SUBLIST_CONFIG(v, V);
>>   KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
>>   KVM_ISA_EXT_SIMPLE_CONFIG(smnpm, SMNPM);
>>   KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
>> @@ -1034,6 +1142,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>>   	&config_fp_f,
>>   	&config_fp_d,
>>   	&config_h,
>> +	&config_v,
>>   	&config_smnpm,
>>   	&config_smstateen,
>>   	&config_sscofpmf,
>>
>> -- 
>> 2.43.0
>>
> Thanks,
> drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
