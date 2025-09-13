Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD54CA101F
	for <kvm-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogErx18B1f2r4reOz7amF7m7rUZhOpyyXWhNoQASDrM=; b=epT8FRY3vpvXBm
	ZvhcDUy3xKg5JcaPshqExhkW/h7LxlnGJPChP8Qe1au8qUx9It10dYPl2wy8XhUC0QxekgRJpeH2h
	2B15aLixGDoH/nS6FxCW7m0sevFLhVW+FJShcHfpy+QDLnmyRLMRfEuCX5QF8SNExpx+KcI+3CQDw
	cPoPU0ESnsluci9ZxHuEiX4w1Qup6ouXNq50TD0qW/tehkIzh5M8krptA3wzEL7SpQT4krzUZENgT
	ugjtrKVEifGdCb1199ogWKAHXUJimrAIuUKKoKX+fVLVvKd9AY4zYqNNTrFBRjOEgfrW5gecwelX6
	a1dcKfTvqqPiIOhPjTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxF12-0000000Cbyh-1VLM;
	Sat, 13 Sep 2025 01:25:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxF10-0000000Cbxx-3g7K;
	Sat, 13 Sep 2025 01:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9I5RI3u2DR62/QoMG7oALiPeUv+mWBlAeBBb+VygSaI=; b=BMcxMtGrsmUEhD0Ideph5rzn86
	mnjt/2JJ6HGHpDVujmOdhoNFbOSdTVWwHGPWoYYJsY1eelz6N5yUAwTa8tOG9DQnHaXbdUKTT3anj
	gqrXjVEgJpunwSCoS7+WmlfwiV9xP0Q/zpiqu4UEZj21+drM+IoGUL9+5jmFXPnsLAjfMKA5xCcmr
	awcFLrfmOnImcJGBZl+zhzlPByHE4m3bPfjnT7ExPDDJzVu1HHB1JgiXznKZE71G+oXtrcUASPy0b
	HwwuGJ5/zTYBpj38AIUvcVFru8SF1jq25kVZLLZqimpDrgyyvoiyy9HUsz6BDe1VOkSxbVUUWJEL9
	pjMFwp3g==;
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxF0v-00000006XGY-2j6l;
	Sat, 13 Sep 2025 01:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757726702; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=9I5RI3u2DR62/QoMG7oALiPeUv+mWBlAeBBb+VygSaI=;
	b=FG4lktRNKQ4iA2RZYqkhjM/g7PPPcXXzlouPK6C0AAE3/uGo+w9PXAsc8L/sMOnKbRdCugsWg61EnqU7mYfkw8qsuqD+grTf+MphqYb5qd+/X79wkdEpmPmy/Wo1Y2bQ3yPpd01XWs8t1nizK/pK9Sm2SIKgvc+oUtSW7Ny2leo=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WnsD6mQ_1757726696 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 13 Sep 2025 09:24:58 +0800
From: fangyu.yu@linux.alibaba.com
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	graf@amazon.com,
	guoren@kernel.org,
	jiangyifei@huawei.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbonzini@redhat.com
Subject: Re: [PATCH] RISC-V: KVM: Fix guest page fault within HLV* instructions
Date: Sat, 13 Sep 2025 09:24:51 +0800
Message-Id: <20250913012451.33829-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250912140142.25147-1-fangyu.yu@linux.alibaba.com>
References: <20250912140142.25147-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_022518_892984_D844DB24 
X-CRM114-Status: UNSURE (   4.91  )
X-CRM114-Notice: Please train this message.
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

>>From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>
>>When executing HLV* instructions at the HS mode, a guest page fault
>>may occur when a g-stage page table migration between triggering the
>>virtual instruction exception and executing the HLV* instruction.
>>
>>This may be a corner case, and one simpler way to handle this is to
>>re-execute the instruction where the virtual  instruction exception
>>occurred, and the guest page fault will be automatically handled.
>>
>>Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")
>>Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>---
>> arch/riscv/kvm/vcpu_insn.c | 21 ++++++++++++++++++---
>> 1 file changed, 18 insertions(+), 3 deletions(-)
>>
>>diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
>>index 97dec18e6989..a8b93aa4d8ec 100644
>>--- a/arch/riscv/kvm/vcpu_insn.c
>>+++ b/arch/riscv/kvm/vcpu_insn.c
>>@@ -448,7 +448,12 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
>> 			insn = kvm_riscv_vcpu_unpriv_read(vcpu, true,
>> 							  ct->sepc,
>> 							  &utrap);
>>-			if (utrap.scause) {
>>+			switch (utrap.scause) {
>>+			case 0:
>>+				break;
>>+			case EXC_LOAD_GUEST_PAGE_FAULT:
>>+				return KVM_INSN_CONTINUE_SAME_SEPC;
>>+			default:
>> 				utrap.sepc = ct->sepc;
>> 				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>> 				return 1;
>>@@ -503,7 +508,12 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
>> 		 */
>> 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>> 						  &utrap);
>>-		if (utrap.scause) {
>>+		switch (utrap.scause) {
>>+		case 0:
>>+			break;
>>+		case EXC_LOAD_GUEST_PAGE_FAULT:
>>+			return KVM_INSN_CONTINUE_SAME_SEPC;
>>+		default:
>> 			/* Redirect trap if we failed to read instruction */
>> 			utrap.sepc = ct->sepc;
>> 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>>@@ -629,7 +639,12 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>> 		 */
>> 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>> 						  &utrap);
>>-		if (utrap.scause) {
>>+		switch (utrap.scause) {
>>+		case 0:
>>+			break;
>>+		case EXC_LOAD_GUEST_PAGE_FAULT:
>
>Here should be EXC_STORE_GUEST_PAGE_FAULT, I will fix it next version.

Please ignore this comment, EXC_LOAD_GUEST_PAGE_FAULT is correct.

>
>>+			return KVM_INSN_CONTINUE_SAME_SEPC;
>>+		default:
>> 			/* Redirect trap if we failed to read instruction */
>> 			utrap.sepc = ct->sepc;
>> 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>>--
>>2.49.0
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
