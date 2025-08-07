Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE19AC87FCF
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nANQz60P7nCE6e4UJk6B4t91xbwfiKqmT/jn5T440vQ=; b=CbVs7LFv+IDYZo
	EWZSWu6GXd9vYB5188qbo6aoxy6TiCIIuNINawJ1INeZDxGXjSKKCa6Cgbh7wtfJJNQ07An9j6A1F
	jop77QziQHbAYDd/92tL301OT93VlhWbAopDx6fasc9uBWdgZkqJe/tZ9jsgP/km2L1cMBRd9oeuA
	b5FZbN91YHD2MyoPFLpcxwKB2XzEnjbyv/aBYFVwBfpWY3FtNoYw30yhzhmUqHfPjSbcUA4kVMxSE
	N+2QyiBzJWLsNJsI8Ph1ln6IXjAKPoI8qbqrX7smtTs/2RtpME0u5RW1IhRQBM3nvNECVkA00FxsZ
	9/K9lbuR2eLKdkkBf3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk26c-00000000vMM-31Ap;
	Thu, 07 Aug 2025 15:00:34 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk25u-00000000u1G-1rtd;
	Thu, 07 Aug 2025 14:59:52 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2402bbb4bf3so13303655ad.2;
        Thu, 07 Aug 2025 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754578789; x=1755183589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEKBOFcXEZzeUzMFUmEzc0IXYr/dBeW4zd4vFjmsRos=;
        b=Fumy8EkE4Xfg0gK/TUvuKzk3y8vg+osTS0UI8WChKx0ytpqIfMa0xQtkkh+TbdzHFW
         epgviNg+yJpuyYtYuyfFOCKQg36FziA4sXHnv8p2Miwvatv+c7gZe1O5fvPT8qSQPCyC
         Qo9yFbSTti0I/MwA3JJtqz+0HEURT6NsdBahemUXWkKFI1UL/HXaamuZvBk52wZB0lfY
         MJsAdJq72jtrYQ9xGKz9mZBol7927Y1jnQS2Jj9FnuEBtYHeyMeTi1+P2XKkT2igkTKQ
         KU5I4nc9rfNw1ITPhWtHe/JWt4icjm7/pwrE9cmtS/a1UvAi8Wlt3XvCQ88r455V5bju
         fMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754578789; x=1755183589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEKBOFcXEZzeUzMFUmEzc0IXYr/dBeW4zd4vFjmsRos=;
        b=Tz3I5W0dNhyEZT88faQFaOcAvQMBp0RVtzsju6Go3pepKyaUk8xA0ll+WFbpSEx3UC
         D9pK/EG9Hqrsi24gtuVHcRFUlIoPxk+ojZAUU+iCE/qGArCAg4Y3IxinI3Ypqk5QRdcF
         6dhshass7NQhBYLeDTQVqzzRkDR5LjpsR0F1db5O5szqBTj3/htAzd7pY0YtK5XxWtMz
         qBKd8yoV0jmZT1vc7nCdeIoMiw0/hUFECGEshjKkNdJ/iW+TRJjuGc/WzIx4yiEPUhyl
         pfTbAVicUGSZoRG3svCEKQCO0wY9X50kfTykUBEzrU9XCfIRkDPkYg/8Md71GxT9EyeW
         PWlw==
X-Forwarded-Encrypted: i=1; AJvYcCVw+P66vK5jTzrBMRSNjBshcdCD9AkV9AWQn3j5eulhW42wYBKAEmrx6tBH8/8m8Ee6vZYiu+Ig3wGo7r4=@lists.infradead.org, AJvYcCWXnpBpOxzW8dssQejciU3DreJafNI4TBK5VW4NkqxLKDb/9l2NL8Zd4yqc8LX84sfHpwGNo4/ykwU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdONggVebhdcPmr1fTyUQk99LsWT+YSXbXYnhL0qO9qo/U5VFq
	aSmqYXWjTqb6hl0Zm1q8K30LCQwVXaQ0bvquKgLfnukhNDQofxF/APn5
X-Gm-Gg: ASbGncuoKVz9IYlPn8mGf1bJYEtq6Mg3VZe5ivZB3UZkWGt3+rlR2F16pKpw5RfALT+
	JYfyrCZs3LObh1TQfgqf1uQv7HBwrPvnF0HgME243IsvzJihJ2OGE1XBiPMAD2nRnkQvFAn/5iL
	h+3qxfLqzS3W9QiksdSfDBA1lDGvZmS2fpee495ur1SLssz+Mawyh9QNKfSBZqg/yhdCA7U2xPQ
	aF7p3AWwfxt0c8SurRTZZT5oVKmDJbwx7zKkfMA4VQlAyi9HxA7H7JKTd0StenWUGi5Ql/FaujD
	FTPQsL41oLBuofIgoarmL0cYN4+feUABmeUslqKKHVUqB/XiE36HlRlAmQWZbj/JMpyDAB8ULQP
	2fGJbDLfeZYjmU0PLq+Ee0YCM5RifHXCOtg==
X-Google-Smtp-Source: AGHT+IEKQGRwDJq1V8V4pFVhYsK4f9Gbh8SYKbU4QZlJjvPkkv9DEDqw9cocLhhr2stwvSgsFgK9Hg==
X-Received: by 2002:a17:903:3c6b:b0:240:3bb7:fdc3 with SMTP id d9443c01a7336-242a0b6eac4mr81244295ad.28.1754578789452;
        Thu, 07 Aug 2025 07:59:49 -0700 (PDT)
Received: from days-ASUSLaptop.lan ([213.130.142.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8977896sm188254875ad.79.2025.08.07.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 07:59:49 -0700 (PDT)
From: dayss1224@gmail.com
To: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Dong Yang <dayss1224@gmail.com>
Subject: [PATCH v2 1/3] KVM: riscv: selftests: Add common supported test cases
Date: Thu,  7 Aug 2025 22:59:28 +0800
Message-Id: <09544c24d724a0e9d01c34b3d7599d860919ccb6.1754308799.git.dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1754308799.git.dayss1224@gmail.com>
References: <cover.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_075950_558024_C0A8A3F2 
X-CRM114-Status: UNSURE (   7.47  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Some common KVM test cases are supported on riscv now as following:

    access_tracking_perf_test
    dirty_log_perf_test
    memslot_modification_stress_test
    memslot_perf_test
    mmu_stress_test
    rseq_test

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dong Yang <dayss1224@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 38b95998e..3a7186551 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -197,6 +197,12 @@ TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += coalesced_io_test
 TEST_GEN_PROGS_riscv += get-reg-list
 TEST_GEN_PROGS_riscv += steal_time
+TEST_GEN_PROGS_riscv += access_tracking_perf_test
+TEST_GEN_PROGS_riscv += dirty_log_perf_test
+TEST_GEN_PROGS_riscv += memslot_modification_stress_test
+TEST_GEN_PROGS_riscv += memslot_perf_test
+TEST_GEN_PROGS_riscv += mmu_stress_test
+TEST_GEN_PROGS_riscv += rseq_test
 
 TEST_GEN_PROGS_loongarch += coalesced_io_test
 TEST_GEN_PROGS_loongarch += demand_paging_test
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
