Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AB5C55196
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 21:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B5Osp1XL8ea+Hhbft4+i1tomfkYodI9LLeyj0iDRjt0=; b=4iqRmkZGCCWcrw
	+PeLfILRQRzlVtzorQYNr0ekZLXhJK4/vw71xucDhVWWhcao8v5+AP8LpNs151fRb/xBkZUrHc3LW
	OcNIGRYvU5yaicGOHyDFrWlGsoTkc2aLE611ysqrA+1C5NLwz6QveKF3G88/C/HmtOFrHh8L685Xk
	bWkw7o3y0C030lmRUnLp+jdFvle5R1pEwVtfevHfcVL/CXm7ZjEg5qJD0OtHzR1BmSMsgFJ8h1HR2
	Baa8N4OVMQnleBHw7+CsIaxOd+kdebnNBu85MD4RakGQlKui9vg/BSlk1dRghUSOz5hfXgeBpjtsU
	ThhDX4T9mJYH+U6SniAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0ay-00000000Yhf-2lwP;
	Mon, 03 Aug 2026 21:53:16 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0av-00000000Yg1-2Ijx
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 21:53:15 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso2563655a34.1
        for <kvm-riscv@lists.infradead.org>; Mon, 03 Aug 2026 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1785793992; x=1786398792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hFj5fkOWDX6E8mPElA+UXDuk02rZ/QIYAtSZ8WctP1Y=;
        b=EwsGPlulTuOhgXXsBe4wK6bl7qGspWGbmZNwkl9hOZUSFz5DtTgF+OfFqQ8LtyO9o5
         5qsMiwAnHdujh8Mk/uLSCfO6uB/SrV40mJO7It9qRJhOwVhZv1S+EFFo/l4/eo+ukDCF
         G/26FVzTyv8LjWCLjVaWydevZScGDcTvHpIBoBnxw1X62yGqbDI5axDVtSBjL3fsqFij
         127K726TwHKoAohbPkKc5WQI548oh66c113g6REKKMV+MKeWBV120HEnP12mxaGCgi01
         zw6bWwR+G9qDwGSzkHjdgv1NqEAyTrZlPSJUhcUPYaaQCJwDsk1jOfWYLKhnDe7P01p/
         cZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785793992; x=1786398792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFj5fkOWDX6E8mPElA+UXDuk02rZ/QIYAtSZ8WctP1Y=;
        b=dfNmKgrr2+7c18KyW9ZnH8xPMcvS//iQXkKZf86kx2r8mzjDM9pjKy2q+FPaBsUDzV
         9bhXHhuB/vz3/whpX6JjK6X1gb+5tjJGzHKWjJWdmaqWbqB16XYEdpvkfe5eAdYSo7ia
         cEiwj2gChCoprYkwqTnEeZsv8PskvlB6JRCNuDbANh8vbsfCJcihPauvhNEXeT+gZSQ8
         tkV4eOnyx1qYF6ckntSdvg7W1DUdvsELycB6wYyHvquhYHB2oe4rxBaLru37m6xlTToL
         ovRwgE4R1XB1mGht4IvmDsk2sh31UT+LcsUEtuMfU1wpxGKa4UWj5eZc+L89tB4Iku66
         wv7Q==
X-Gm-Message-State: AOJu0Ywh4O7LMXJ5guLMmbeREq9+4wdt732dLWKKvY1Kl/OIW0X127+j
	JJB8X2jM3FV7OOL0Yqgd9fmq8RB6gxCTtTqFX6MrV53Xy6Kay5GM2rcjn1pXP5VXDaI=
X-Gm-Gg: AR+sD12B88YGs92Vkrm9lsAzi2FE4r2s1atZbfxa3iNg7e2cHDgth5JtGXr4Qj+OCud
	ct0F9ijdnselJWBbs0/fR7vzJje7Rx8A3+IqeQc+Dw8652OsuYDdSoz47j6P4sKyK5szozOjINV
	Id21qY1Dooh7nymcdUyIV1VVi+elwjBcqXH5WKMFnS7MrDcSl6nKXJnULHJuqNBXoP7jk+Oi+Ph
	LtsloPsL16JZAPZlK4OFBpaSZB8uftpArBbcDZwWjEqpp22J/idhMmGQLX6c62oA8lwnVxZM9LN
	C9F0UH5BY9SD23hwW6pq37xafQoUh0W0ImuntbBJHwjqQ3L3z6NDGf/SJdKjHTfJtMuXaxznk8n
	7FTYzJ7KwJEcJTs8sD8InsM0tGK0MGZ2PhZr8TIE2OD4O3X9CAA7hDH2nmdSFgUqruhMzvaXv/2
	+lzyeTHExxPvdUf1CVUZnPhGjviqgCaX5T+OGpYSHKSzb3IkB5ixvpqwbddrNxi+OfQDoFZadiD
	GNfh24//sqVbl7b4I5rb4F9dTpP1e64mWjF0Q==
X-Received: by 2002:a05:6808:2221:b0:4a4:866:c39e with SMTP id 5614622812f47-4af5e1ce788mr16822670b6e.11.1785793992035;
        Mon, 03 Aug 2026 14:53:12 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58e9551dsm7403958b6e.11.2026.08.03.14.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:53:11 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	andybnac@gmail.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 0/3] RISC-V: KVM: fix vcpu vector context handling
Date: Mon,  3 Aug 2026 16:52:39 -0500
Message-ID: <20260803215250.824417-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_145313_599791_1C7D1F97 
X-CRM114-Status: GOOD (  15.27  )
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

This series fixes a vtype corruption encountered when running perf +
vector workload on KVM.

The root cause of the bug is that the kernel-mode vector (KMV)
misattributes the guest's vcpu context as the user's context. To solve
this, we need to correctly save the vcpu context when the kernel-mode
vector is serving a guest.

However, calling directly into KVM from RISC-V generic architecture code
creates a reverse dependency, which is problematic when KVM is built as
a module. To address this, we introduce an RCU-protected callback for
context flushing, which KVM registers during module init.

Patch 1 is a preparatory cleanup that refactors
riscv_v_start_kernel_context().
Patch 2 prepares get/put_cpu_vector_context() for gaurding the use of
vector in kvm_arch_vcpu_load/put()
Patch 3 implements the callback mechanism and fixes the context handling.

Reason for this respin:

put_cpu_vector_context may casue a volutary ctxswch. If we prematurely
set RISCV_PREEMPT_V, the context restore path will rasise NEED_RESTORE
for this kernel thread. As the result, any irq taken during the
subsequence preempt_v would trigger a restore from the empty/stale
context memory on the irq return path in riscv_v_context_nesting_end()

The fix is summarized as below:
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -181,8 +181,8 @@ static int riscv_v_start_kernel_context(void)
        /* Transfer the ownership of V from user to kernel, then save */
        get_cpu_vector_context();
        __riscv_flush_vector_context();
-       riscv_v_start(RISCV_PREEMPT_V);
        put_cpu_vector_context();
+       riscv_v_start(RISCV_PREEMPT_V);
        return 0;
 }

We will send a optimization patch that removes the costly riscv_v_is_on()
for voluntary switch detection. A kselftest that stresses the vectorized
user copy will also be included into that series.

Patch summary:
 - unchanged patch: 1, 2
 - new patch: none
 - modified patch: 3

Changelog v5:
 - add the r-b from Yong-Xuan
 - fix a guest boot fail that hits ~1/100 in host kernel-mode vector
 - Link to v4: https://lore.kernel.org/all/20260725001749.2579274-1-tchiu@tenstorrent.com/

Changelog v4:
 - Include a header to solve a mid-series build fail (patchwork ci)
 - Drop preempt_v_started test in may_use_simd (Sashiko)
 - Link to v3: https://lore.kernel.org/all/20260724165001.2317788-1-tchiu@tenstorrent.com/

Changelog v3:
 - Limit the export scope for {get,put}_cpu_vector_context()
 - clears RISCV_V_VCPU_NEED_RESTORE flag in host restore to prevent
   leaking
 - consolidates guest vector restore at returning to guest to prevent
   unnecessary save/restore between the preemptible window from
   vcpu_load to vcpu_enter_exit
 - Document flags added to riscv_v_flags
 - Link to v2: https://lore.kernel.org/all/20260715051629.1169645-1-tchiu@tenstorrent.com/

Changelog v2:
 - Address issues pointed out by sashiko (2, 3)
 - Link to v1: https://lore.kernel.org/all/20260711015835.767259-1-tchiu@tenstorrent.com/


Andy Chiu (3):
  riscv: vector: refactor riscv_v_start_kernel_context
  riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
  RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 +++++++
 arch/riscv/include/asm/processor.h       |  8 +++
 arch/riscv/include/asm/simd.h            | 16 +----
 arch/riscv/include/asm/vector.h          |  5 ++
 arch/riscv/kernel/kernel_mode_vector.c   | 88 +++++++++++++++++-------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 12 ++++
 arch/riscv/kvm/vcpu_vector.c             | 22 +++++-
 8 files changed, 139 insertions(+), 40 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
