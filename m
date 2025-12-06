Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A2FD3ABC2
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RD+04arYYPol8+u+jN9uY8liniS2jlXw+EVfnaVHQAI=; b=DinCuPT9kU6zKb
	JSVkihxH/E7pHVBLJpvejM84FOX3mnDQBeRV7FutoIg0G+CFsz9eycSe7WhtA2sPxeFb4YYaXZZDN
	Cen8aQP68g7hFXo3zBCYnUfR/Jdkrsh6umw5LtQbu4kQdu77PVgQvULp187QXAlbvtAwNJ2Uxa293
	59bQvQARYrn2B+EgyEpZgb07YUszGWmb3CRXl7RicDP5Nj0HTDWn7R3VSTww2xc8W87KA/ZZl5YUe
	3xJxUGLg/sAyBamTvtyEdWZbmaZSHOP3qNX55LNSrRH8Q8UpALP5PZhml4wk+0+C24tIi9+1D4OLv
	+5QlsoqO2HpLTL/jc7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzV-0000000AEFo-3hc0;
	Sat, 06 Dec 2025 00:17:37 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzS-0000000AE9N-1P82
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:35 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7d481452732so4329231b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980253; x=1765585053; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8zDbYh8g4andZgSq5KjxfJP+Yx1X56NwE8CC/T+SiEI=;
        b=UxbqAu1CXeeAy7Zx7Ye2HeAH0Vt3L+sgr6489etCF7BbrBjUES28CteCtyaPKmxoCu
         M/rretCjF6joOzMBXxhukQ/0KPKo4q6psS3sgkyxF2pF/SASqkUonF2idz3jawq1Vs7G
         kBqOUGkQSCZBbWYiYzFeQJONwdIJ8SysljkKweuPW1SOzgvtp4wBcoYCklvgrtNZH1nd
         j5F154Q/HmdBsUh9vcHORTlubgYsmj1uCY53XVN4jopuEI9AcemySiXVDA3pL8F7ITkM
         xnGJ6EuY4v9CHUeq6QIq6oh7gnBK6Wwi+PO07guF5iwJ2ljaNI8hMsZXAuTZLEVGJy8e
         VMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980253; x=1765585053;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zDbYh8g4andZgSq5KjxfJP+Yx1X56NwE8CC/T+SiEI=;
        b=Ob2MK0ZXZqj/QAVq4mHiMARBeFb7FmZjzDG44BYIz/yFyiSEh9Qdm09xcMTz49PnGq
         57D2FvBx2QER6x+we+oGB8NSvGMxpxtVt7/c58X2GifVolgmTmY0aYc/sL1RtbmDBcJf
         g411d8Y4ID0E+7KTOT0R/h4tRqBU0vjbeLSY/87W3LAqSRJedcFveWCFXanwAKxd7i9p
         kP/gYl0d/ZDypVi07z6MZ6UVcTtHy9JpOvtfDfa2FXE6JZ7rl23YQSEjnEQJobl0K0fl
         n4E6CEHrVkfRhKORhMwFV/YMP1rLSdMGGTPmkODXmIg5jtENWSvN6FFnfZR9z8sWMAMl
         VP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0I4+Nn8aaWFhk40vywppqgoUEOcHDPGAw+mRF9zZnyP+ZYVVClkI0wuHl1oTZDgFfILHKRILWIkk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2L1gqblZLHrPYEchjIai6LFJ1lIpv2a940J51m2RmRUKCVBbD
	lmmDZMVekG+uAstBjFsiLp8yHsoFDZgQOC5phcf/7IOjFm65rFuuOf7GUaTXltcCqREkT4EoluF
	jPkv8rw==
X-Google-Smtp-Source: AGHT+IF/oM705F739LTH8aiHz6AKpqWGtQrIi8ngNpofrp5S2I+xWIdijTs20meiR96WS9wVH7kHD0C0BxI=
X-Received: from pgce2.prod.google.com ([2002:a05:6a02:1c2:b0:bd0:79b2:aa3f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7b23:b0:366:1880:7e06
 with SMTP id adf61e73a8af0-36618807e8dmr621575637.0.1764980252791; Fri, 05
 Dec 2025 16:17:32 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:39 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-4-seanjc@google.com>
Subject: [PATCH v6 03/44] perf: Move security_perf_event_free() call to __free_event()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161734_391751_24A81E28 
X-CRM114-Status: GOOD (  11.61  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Move the freeing of any security state associated with a perf event from
_free_event() to __free_event(), i.e. invoke security_perf_event_free() in
the error paths for perf_event_alloc().  This will allow adding potential
error paths in perf_event_alloc() that can occur after allocating security
state.

Note, kfree() and thus security_perf_event_free() is a nop if
event->security is NULL, i.e. calling security_perf_event_free() even if
security_perf_event_alloc() fails or is never reached is functionality ok.

Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 1e37ab90b815..e34112df8b31 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5602,6 +5602,8 @@ static void __free_event(struct perf_event *event)
 {
 	struct pmu *pmu = event->pmu;
 
+	security_perf_event_free(event);
+
 	if (event->attach_state & PERF_ATTACH_CALLCHAIN)
 		put_callchain_buffers();
 
@@ -5665,8 +5667,6 @@ static void _free_event(struct perf_event *event)
 
 	unaccount_event(event);
 
-	security_perf_event_free(event);
-
 	if (event->rb) {
 		/*
 		 * Can happen when we close an event with re-directed output.
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
