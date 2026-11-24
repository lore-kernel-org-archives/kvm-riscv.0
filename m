Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F26606A334
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ItRKoM8m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lr1aXTLR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=giitQr4MqJqU4n4zwxD2F5+LlcbJLsoDtUleC3aem1w=; b=ItRKoM8mRWo1et63TU8gwdKaPs
	Gnle1EFYa7Pj4+chTB/mA2faKSMu3Qp8cQIbOXpGz9zciDJVdmlOgcrkR5mHQgEQuLDLe7kbs/fsy
	EIldwrsL7o2WiTfhiJEePI2A6bbcxG+UL0q9Pg5NQSqxi5ITseLXfQzrCIVnsoob7nGoXfjS7UGzw
	DXGI7RoB94lQmZUz01L5zht22/cmIo5IDcv2kplBZAky9svJj99JgS7IvmNR1kNsvP+Z2a4MeD+Ht
	14Dgwv1Cp5jXHaZi8VzxxEr48wAzrF8g9hs0Qv4+WdDudnGLA7dpuU3Dadys040J754qfc+W+w2om
	W/t7vgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHw-00000005Rn8-2Bcc;
	Tue, 24 Nov 2026 03:33:48 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHq-00000005Ris-2ycU
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 03:33:44 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-3b411059cd2so914055a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Nov 2026 19:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491222; x=1796096022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lP3ch59NAPtwcIuspqlGBS3z7FlOBtLkp+myFltPlfI=;
        b=Lr1aXTLRfgocSN8qvyLcPy5L5e6dsjpkMAcHew0WUg4KDsuesO2VebsbnTal0Rzitg
         IrPXWEWoXE3aH+IZtm26Dvto9EWH4SdP4Rgim4wBBSTKWr5vPAmzVQbad4IAf6QmudI6
         lnLGEK+ABndAA7NfYxwz8EO0YyoTYZccoJHK6qmDWm6YbSk41zyAJwW7ne4MLt0K7xS0
         rvXBM3z/mTwV6s8+xJy+qUU0dGyxFb0tLVJUGllPN8Z5sh+opRvDqOf6C0mlaI/n1j1D
         l5HEGhvLrI/uePkSQRv/y6jXlAitynY1a74fuW4IoYvHkSEKU9dRnSVbkI0bt4/8NXNy
         JDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491222; x=1796096022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lP3ch59NAPtwcIuspqlGBS3z7FlOBtLkp+myFltPlfI=;
        b=PkVr2jx3za0enbGoIO93vLJMZ6/mX/0Pz52H5ZIGFZExuqSh8TxJgUoeL41rFgl5Qq
         3GEH/NEDKUL2K+sAk9zGqURbkGLEPQ69A9KHq7S2/VbbbtkmjeL62oOUcvD68Qnv9VhW
         3ajZuqLs/A0At0rbKn8A0wCMdw6WlJUadQr3dDSCAZETujmpuwQg501t4naK50fynoF8
         h7eSrEIGBeQJX8StKVTa8WnEYJl/dId8piQQFdJeoefKSwMLSiXllfjM4wWwGZ3XJFWK
         f99CcLSKPARIKMNDyzYgP+7WfRgRmdQr4AnOYzBTYn2i9rk/ZzEIFjv49RemRqbc2Wo4
         GUCw==
X-Forwarded-Encrypted: i=1; AL+hErHMi/j6o26rBWSayL5Exm6mL+/Bmoiqky0QTy4MeleKOCGOfv0GD0CKXWxbLAjCFzDlH9cF0lCxDlg=@lists.infradead.org
X-Gm-Message-State: APuU4Z8lNJ7+/0D3tJ+fgAqX9msN6bOCenue58zgMxIb7PbK5BWojyL/
	D22FC8TVUPhljiJmqdsJ08floQUJxZhMyZJvM1r9ZXOHWE+BBSt3RRTC
X-Gm-Gg: AZFdTZdUWnEpZyvco/ZA3di0W9jzrOSKR/Mo19swfqsaGu9UZKaP/UOC5f3AJUvQnGH
	CDzuyuwIqSDEftW7oyEE3giBqnpeNbDO9jcHP9QXnh712lN3sjtrs38fLcq/Sl34zILMwfCA8/w
	Gncs3sYT6e994TgZ6Iyis0S/rD3r9JS1dV2dKGguZhI9FOWE3w62cEjwnsIEg5n9VAnoNUc1tMB
	xFWl+8pO8gjrhpO/wAm7pRChIaK3N/AtH0is8MgDn/cbZFUfd8tGOt6t6iF4qNvYuWCBuU9Ekpr
	YxyXkSTkpBv8RloOCr5cFGCOdar2nkukHkH9MQkkbIgd2umfDoVdgw1w4UFCrp+GxtCTRoq1fgM
	vjlysoi9kPZAKq6YAmvBjj8P1WFsWFI/Qfd5aJBVxitVDFtKQ5BR1P55ek+xK3mcMhNMRvjp52/
	7Qe+WAwnXhyF4GTS5/ziTpVfVOnjOgt/LGyFFnJt/Uq7p6VTmX8OmsvIBY+t/ZQFFvygcVEUE5d
	1FMGmVfdTTVeB99s3GVBa4gbPq+Gn0MQ+1gloO02i4pFhaP266h4otWg9PLJDdxv1CEe5oB3JFc
	ttKQUI/8MbDVeaViNn25d5tYNMYrW/RjljB2mMlzDg==
X-Received: by 2002:a05:6a20:7489:b0:3f9:a6b6:e16b with SMTP id adf61e73a8af0-4014c94a618mr11685070637.21.1795491221907;
        Mon, 23 Nov 2026 19:33:41 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm6495773b3a.3.2026.11.23.19.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:41 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@linux.dev>
Cc: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: selftests: Fail explicitly when schedstat cannot be read
Date: Tue, 24 Nov 2026 11:33:27 +0800
Message-Id: <20261124033328.612894-2-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124033328.612894-1-shanbeeyoo@gmail.com>
References: <20261124033328.612894-1-shanbeeyoo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_193342_774434_C4565932 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

get_run_delay() currently passes a failed fopen() result directly to
fscanf(), and substitutes MIN_RUN_DELAY_NS when parsing fails. Steal-time
checks need real scheduling delay measurements, so neither dereferencing a
null stream nor returning a fabricated constant is suitable; repeated parse
failures also cause polling loops to spin indefinitely.

Assert that opening /proc/<tid>/schedstat and parsing both fields succeed.

Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 tools/testing/selftests/kvm/lib/test_util.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index f5f7189f9..eccb03153 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -417,13 +417,14 @@ long get_run_delay(void)
 	char path[64];
 	long val[2];
 	FILE *fp;
+	int ret;
 
 	sprintf(path, "/proc/%ld/schedstat", (long)kvm_gettid());
 	fp = fopen(path, "r");
-	/* Return MIN_RUN_DELAY_NS upon failure just to be safe */
-	if (fscanf(fp, "%ld %ld ", &val[0], &val[1]) < 2)
-		val[1] = MIN_RUN_DELAY_NS;
+	TEST_ASSERT(fp, "Failed to open %s: %s", path, strerror(errno));
+	ret = fscanf(fp, "%ld %ld ", &val[0], &val[1]);
 	fclose(fp);
+	TEST_ASSERT(ret == 2, "Failed to parse run delay from %s", path);
 
 	return val[1];
 }
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
