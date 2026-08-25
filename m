Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E86C61DB6
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qkBrAqKQnkMerKSC/vfmJ2zD+9EPpHzMThHWUQxKCdg=; b=QrabDcChFSM6OK
	O5YzwL75EFQ/z8QUkt4UPSCRzAPMKoNwCIu+HfviBfFapIdwi0VmC3A9xzezTSufKtIrdCy70zVRU
	zQ73JXr6ufCwL0rpzx2Y73F1Tov+iMobETCJ8PJfLxWE4ELNUQwzhtHpmzdqBp/HnALxDNsxTbeqG
	4oI0MvVOW8SolNMGYs+Enc0Y4XV2lc43NP7OWXmW75e6gRjg3KALPU0YaUPTGfaeSQC+xJmKSGaqg
	5ZrZ5xP7M+UB2WULWGceCDbTtxmabahUsEzQAy+lgJMJN7tcsV9pbMROuDk1IDMoZ9sdVZOSMc/qg
	hrYNeAYuh7nypGpS9/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymf7-00000000Oo4-32sT;
	Tue, 25 Aug 2026 08:37:42 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymf5-00000000OnD-0fVv
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 08:37:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c9aea40d799so2725929a12.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Aug 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647058; x=1788251858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTiqxajFCS8JhT00U7QUj901RHFXVk9RFW4qrD2ZWqc=;
        b=n6eYs0k3dsmQDS8AzNMsknuIakC5ulwN/nuHdt/c+/9HfYt0Z46qBL6uzB2wp6rm07
         aoHIbkTEbMQlvkzlea+kwT7JGQGtAn3fPOnMfs+15uNsZXLu69O5zIKQyPjDLyWjvGum
         Z+arOAzBdnn4Rjs0jlJ7b0UaqOAmMMVuBlPFMl01jFamNObZEZbGqmWzzdwOZktLFm7b
         5EL+kFoXleC+uJ0IAopS3EhbDSp8TJFNBd3tgAFqphvxZB9c+NUrJvJGHg43yUsNekLk
         jDIiDoIIDpvt3J2l3jZVQ/qzof64uGWfLv0VGs8UK0EW2vffRStyidbt+TXYUFYk2gA6
         FbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647058; x=1788251858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTiqxajFCS8JhT00U7QUj901RHFXVk9RFW4qrD2ZWqc=;
        b=X4TDcROQsCsSF+s0G+NuER5pYza1VxMc07SsNET1ejCZShlDLpN7Eb/MTcOVA/lxzV
         AoGo9/Bw2OWZS2Vqp/ZMrk6eeO9xExdmbeddlXDdVxdWBKxu0Ca/M+DhAwwNEZPOYow5
         z2LQHJiFp/z1w9RiABbv9SPdiOIAJEaElkbY8TVmA74nNsfiKoTy7xciND09SNs8eV5C
         DGFesaZ1aVGtviKlY2eMjskGzMWmZEf3afOTKWA3KpDAy3Sc/nJqYgNlhGrSIBGR6EZV
         GiSEBqBNUdKdRPRXZ+PwsRnctdrtN0gB2qjJRPUlcB1OkAJa/tTcKGh3lq8Qo6FEVgkm
         yZ5w==
X-Forwarded-Encrypted: i=1; AHgh+RoPpS/AHtcCdm5ue7G1y6dq3j8OE956442mDFAI/ohm4V1VeYOKQt/gWrFS5Nr765N2rKplql8gPjs=@lists.infradead.org
X-Gm-Message-State: AFuF++lkmX+nJDLC/IRAMuAGsmGZFd2ODbi8pfI/QkXagMEcGjes86P1
	8hgaHautV4zWf+QUM3Q/1HsiKya8RyEdmUfUiaQNDRfNOHXiLrY2TnWS
X-Gm-Gg: AR+sD12jeVOuDciyoYcj4Iu39zG8xvtoV+tTDq9mS8z4jsLGtuIkxnsDAvKejJL4pKT
	MApI9VWpbE7D6uaZAsKk6kwDLK7I29U3V6LbyZrHAfOMQ0t3yfoUB7Sp3RVy5xMcTJGMX6KgR8/
	4IPOjY0eNrvZG6yD5f3Tv91dDxf5b5QpKbjnxYrD0SHB7Zd/GO6soYqc7nGJD7qjBi2GU8Zfn4h
	AcVtOvLeZEzeyzhjqIIxWNSLjBnUYxMdagogtOSDD57Vx7HYdxm+HVdMB5SW1OjH+lTUdCprlZF
	KoIh40Si36/FTG6I+G60gcIowhQqZZFYGHKcVzs9Q7HOSQfmVr/8kcTSWVDK4usKvuYt5280Ota
	r43ThMhkWFFEIbqM/Da3l1+rkP6gHt+3roQKZDdU5Vdw0kr1j2LbgLz5G9uBBxWS86YOSwYjVIT
	wwpqycOqaiW3TqhVpKRmhx7IKRHSAjk7+aH6A9yA9Djy59oEbxoDYhsSrd3kkKVJr51zM4waz+H
	B+AIzfKCo9Y
X-Received: by 2002:a05:6a21:320b:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3cd9125ad6dmr10437900637.9.1787647057741;
        Tue, 25 Aug 2026 01:37:37 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:37 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 0/3] RISC-V: KVM: Fix PMU counter handling issues
Date: Tue, 25 Aug 2026 17:37:16 +0900
Message-ID: <20260825083719.643970-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013739_230557_315F284D 
X-CRM114-Status: UNSURE (   6.95  )
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

This series fixes three issues in the KVM RISC-V PMU implementation:

- preserve firmware counter values across stop/start;
- report failures when writing snapshot data to guest memory; and
- fix perf-backed counter accounting across read and stop.

The changes were tested with the existing KVM RISC-V SBI PMU selftests
and additional tests covering the affected stop/start, snapshot failure,
and repeated read paths.

SeungJu Cheon (3):
  RISC-V: KVM: Preserve firmware counter value across stop/start
  RISC-V: KVM: Report snapshot write failure to the guest
  RISC-V: KVM: Fix perf-backed counter accounting across stop and read

 arch/riscv/kvm/vcpu_pmu.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)


base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
