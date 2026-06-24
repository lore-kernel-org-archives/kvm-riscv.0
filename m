Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EA5CDB481
	for <kvm-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6GRDZulq9nH8leHSl/1jDBBLLTXTBb3oBwQw39ZjR84=; b=0FD9XIeVwEIp/e
	fPFeWF/F9R+Bwbo6s9TsGlyWxvn0UDfy+4tO2D1G08mytO+68zhMCht1z/DQfNQ29XKhZjw0Ke2/0
	I846F2K57JGfe2AyzLvnkVE19Mokih5RNsl7LmHD/R5dREAt+PQoL+h5XppBR3L4rMksZEQ2/hw5n
	7aBAqWgau9lWL24PXs4q66BlGB4xrxcXDBXZGXgQu4IqIKeziImlLJOMcJ5PBj+aj2/HWk+IPiNWS
	S9y6pej0Cs7Sgxv1CkUjP9PoRWOs8KpBIct2abHD7uutjY8Sr1NjRiGJgFCFI+xiIrJ0KWC+Q6W6j
	+1hczS3hUSl9HF881dpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNFy-00000007n4v-20c6;
	Wed, 24 Jun 2026 13:03:06 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNFv-00000007n3U-0QmQ
	for kvm-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 13:03:04 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c88973b6965so1143863a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 24 Jun 2026 06:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782306181; x=1782910981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQUuPMmuv/cgtI0GhaDa2PT2gy6UgZhnkw9/EmvR3IU=;
        b=Gn7xyPqtwdxC3fTZ0eOv2u4lMs61AcbErBObYwE2yyukzKyZBKZfSwBjoA1rwW23FH
         0RTu6m4vq7TFTxGhMkvmobHUGYuwx2onjpLCcuyqND3qtyKghguzCik7gAsZRxzG+/YS
         nnj4p+wqA1HUXCrrE/gWfWsgJNtXgoS17xf7jqUAkh8tCvhL1ABR3FmVIXJCFIfOp0lU
         qBJvyDItecQb3dbhwmRa6O8ZZB0q2Okr1phrk1PkDbaXa5OfgeDrj3JfibDqmi5q/8RI
         NAJcMyTbfL+CoxlkW1nofUaS/e997jbk+6jUIa9vZEpF9TOHtmrHvby9sDq0DgIO5uCm
         RLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306181; x=1782910981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQUuPMmuv/cgtI0GhaDa2PT2gy6UgZhnkw9/EmvR3IU=;
        b=L7qKF8p3hFiKMfPMxB7whSPUFqjDYxxzl8EUh/bI/dY69E4689tPH7ojLtm+h11UwH
         X5E2QWhGaX4U9+wEhH0cIxG0jLZKvoylyus+ZRPKsIuHxoAYe7QsrivRRrtnyefjAfBB
         BZEzcD7R39isO4R7BxDmxjqBBa1kuzUssGcXehJkpsVuHb8WgYnjdpVa+hbyJABfe5NQ
         2whfp5nq6T8FxA/no207FMo3evyzR00/sHu6cruvmRXioeniAOed4EKX/h7sFldwcM8F
         yu5S1ov5CotxQK6SR+aotNXkUddQ+m+oL7RFK1oYlO2y5mLyzjkgaYzc0UmPx+eAaAX0
         2KgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpbln4jv2q25UjeZ8Ih9n6OqFLNHGXErxq0ukX/oZmkLnzrPXtH3RkaxByx7o8nRGBYZJ8PYdI9d0k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxG+OKAfSodShTyhKdp8J3to7xMX3nKG/rYJ0TQIij/1U1a0fOL
	TXFaHJpKVZ5t9RwtgmD5xFlQgBeCo04VqsJTWBAjTJTHcKLTpurjDFFp
X-Gm-Gg: AfdE7cn2JeEFoDw6RTJZ1V5G+qOI9xLs5HEKlZ7nM7S+tBpZRiLIrSKv34zlxsRub2C
	tPLr61CB2pEqaR0iUDQ/+NkmM8O0rTdj7QwbRREkU+TdIyHA1kQvCshKqpC6QNcEaXsXAUUmufL
	YL6uqFZkjtc2G9ELxYtDK8L95ZtZ2fIwYTK0yBzC6McCFuerfQR1ltfgxA6yW0Quw1O/0hU93jY
	hs7cgD8OpnrEW2b9p4zn0qtf9bydbA8O+E0V3RY95tQPFFk4lKnpLvBBe3G7cqDs4E8ksbClfK1
	jBhiPXzFA6Hio/5VwDIj48i/K2NFxBcPXOdXFj6dtj6PYdGgr2zAlPSIcu7W9CexQtckszE7Ijw
	h2me5cAj+LEm1MNMm3eZ1CXQTeqbTJPFJtb/fAoomBV9H7TjYXjhZxE4Tmzu6bEwESXJUTpY4VQ
	gI2kLLn0ITEu6PNVTB239zZcAakrwP9AQCuveTEmfl0Gccu3c=
X-Received: by 2002:a17:902:e5cd:b0:2c6:a4ed:efec with SMTP id d9443c01a7336-2c7c40168b9mr61894555ad.27.1782306177091;
        Wed, 24 Jun 2026 06:02:57 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad8esm134704505ad.76.2026.06.24.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:02:56 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	cleger@rivosinc.com,
	ajones@ventanamicro.com,
	skhan@linuxfoundation.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] KVM: riscv: SBI FWFT: Apply LOCK flag only on successful set
Date: Wed, 24 Jun 2026 22:02:38 +0900
Message-ID: <20260624130238.524706-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_060303_142309_087E2DD9 
X-CRM114-Status: UNSURE (   9.68  )
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

kvm_sbi_fwft_set() applies the caller's flags to conf->flags before
invoking the set() callback. If the callback returns an error, the LOCK
bit persists and the feature becomes permanently locked without its value
ever being changed.

Move the flags assignment after the callback so LOCK takes effect only
on success.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index ab39ac464ffd..1342adb3180c 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -327,9 +327,11 @@ static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, u32 feature,
 	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
 		return SBI_ERR_DENIED_LOCKED;
 
-	conf->flags = flags;
+	ret = conf->feature->set(vcpu, conf, false, value);
+	if (ret == SBI_SUCCESS)
+		conf->flags = flags;
 
-	return conf->feature->set(vcpu, conf, false, value);
+	return ret;
 }
 
 static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
