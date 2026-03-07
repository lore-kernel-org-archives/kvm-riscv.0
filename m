Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C97F55123
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Mar 2026 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ZUcye+v8U6Mjsfhq7hJwtwTiqHYak2UqY+HtPd9qqQ=; b=IHdckPc854ViIY
	+AQ4N0Zt3o7IUO5SkMP0Ugy50zFjrj7PmElQCwePMFt6DsyYpD6HIA2Ijnx7+hRQiaXYGmlBO/mFG
	Y/J1zV5Il+qSAkRFtKrvsU3uFvPKyA/McRzi8UXxK+XqGJfdII9xY3t/MuzZ+fwKmCr4iODYZjgXC
	4jnjRtRPiWpkPdVfKMO62zpHYWJPrVkcSxSncItC5w4RVBjw4+dcpu7UXUHcDd6dv6ykGiqITJaE5
	1gwDXgajhUrmO+tjM29tD8w2dFmNK3qcbemqqeHESKMDlE42lIZ8w2z1JX2/fTv+mJ5yTg8idr9AT
	RQU6yBi1XxhiqHtF1ucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz1Ki-00000005a8O-3No3;
	Sat, 07 Mar 2026 23:45:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz1Kc-00000005a7P-3rl8
	for kvm-riscv@lists.infradead.org;
	Sat, 07 Mar 2026 23:45:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso91049315e9.3
        for <kvm-riscv@lists.infradead.org>; Sat, 07 Mar 2026 15:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772927112; x=1773531912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qjRKrJQ2J/VDkoqe2xizeTmn4PJSWMUuw8x/Xk5UYBU=;
        b=j9O/7orSAVIP0XJojifOa8DdTwd9dZaD5RXvBShThuTHCquMDvwRYGRXyZoYyDjtVT
         ZNBZdYVc/NUdvl/y4GsjGM9Z9MTVKebTUSamCALoq/oOuCotWnpBHl4433hFow9TEE5C
         WRnD/WRnhjQTNWcKU7jwFkkMDykpgi4cueMMXzxl1BQuAP7Q+of+He+JK+hhf9av/sPi
         CyEGxRK2LHQDtZunagz4JG4KOIi8hlpG22VCuBr17rxDsaVRWD92XB3q+HGYaItpA3Oa
         xkplrMWWs395IwvcU6ju6Da+RQnaRsyE+xJBM+ZMrq2M3y4nWX3DyMoYPze3dYbpvL37
         SDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772927112; x=1773531912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjRKrJQ2J/VDkoqe2xizeTmn4PJSWMUuw8x/Xk5UYBU=;
        b=jwMmmMCsSmX4a7+hA133jkOn281W7TRWeeJeh71pgy1k0iSZlm8xpjIVOo83qH2z9F
         LuqPNDRa+XfQfKqJQzDvFMBlRUxYn58yHXVjTeqK4juIMWz6icSVLPTk/BZvzlsvTS6y
         l4xeBpE6IWJmwFuQl9iKU4CPnrXf4l3EAQneoIxzYkU3Hj9EiitLPB80EeBm++e+8B2w
         eGp3TgdUT/DYsC5zt+zOu2sUgTEincDVSS9etXfrIXGEWeVS0nHSfFUEtx8Juuvts9G2
         4BJXAxPeTU4lVCx6vjaYWjnrV+p8CMD/MhzIMfmnz4YDfscmKnNaicYkxx+tJEraO9pC
         L7nA==
X-Forwarded-Encrypted: i=1; AJvYcCUc4TsPZTHxkZ0vFfCmbqT90Y+Epi79/aANr7YYTfjWHELRauK/Bdm744HOgWsma5+faHas4x7cyQ4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrn2CsbR/whzrlHKHLfyFeTItz295NEBMVfFLQiZhTmk7YP9R6
	usep91+0aXTz9l9QAj+PU3pSTL0HSnlYOo20ZePu657H67ACV7HKMdbo
X-Gm-Gg: ATEYQzwzWHes7sP+hCnLTv1V6EDgsEKTWh1VNNKxlbNNCbEyo0iXcCyhLxNKTvWiJYD
	8WvOLHB97F/E2EG7tZYkzRV4nkMhoQFTdQgfJPdk8wr3CgnUKYTzXC9MWo1UUXr/DN74/27om8i
	KbUG2xo2htEw7kjyEy1t4gLPPshGb4BhiYRzt/mpvuIddsVooJYI7ZWJasynDShO6Kfn567xrYJ
	nhC9yRqCCfACk13q/AoXOYPX5TlKeoKPCkFW+zjj6/dmiz/sBVtWoFsNuFdfhvUohNYMBGxK4q4
	V5feXEp00SxBBmqs0aOVryIcLYzyMmFuBQXtA51W1logNEkGk6MpQQzMEvkKQJYgTfHQ52jvV5R
	kjDXyUOsKP3dOaamdYfWhV4AVtMvR17GbOkrDSoyReMg3zYJhH6Hh4aEqFwrQV4OKR9lYUBNabJ
	+z2MWe7VnjYW3yXV7E/YnDTkWtGBbCfvWT4pq5zDaVduqnL6rYrwuNZgsqs3fw
X-Received: by 2002:a05:600c:1e88:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-4852690f599mr132855755e9.7.1772927112391;
        Sat, 07 Mar 2026 15:45:12 -0800 (PST)
Received: from osama.. ([156.223.176.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485247029a4sm49900895e9.26.2026.03.07.15.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 15:45:11 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
Date: Sun,  8 Mar 2026 00:43:54 +0100
Message-ID: <20260307234355.69831-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_154514_987209_C1F92963 
X-CRM114-Status: UNSURE (   9.27  )
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

When saddr_high != 0 on RV32, the goto out was unconditional, causing
valid 64-bit addresses to be rejected. Only goto out when the address
is invalid (64-bit host with saddr_high != 0).

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 4d8d5e9aa53d..045099ca904b 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -425,9 +425,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	if (saddr_high != 0) {
 		if (IS_ENABLED(CONFIG_32BIT))
 			saddr |= ((gpa_t)saddr_high << 32);
-		else
+		else {
 			sbiret = SBI_ERR_INVALID_ADDRESS;
-		goto out;
+			goto out;
+		}
 	}
 
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
