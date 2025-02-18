Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789ECC021AD
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 19:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pvOxPCPTz34LmIJBaTU1jw6dopaESF6wzJ8Tum2Onc4=; b=ainzZA8G9JIaJF
	LK44CkOXJbq4M3sAGsAhxyUnZUkvBrB39XiyGhg4FLnznHHh4H3EYWclb+p5lKHWO2C/zUrdf1z3x
	dn2GoWyNraHvPVsqB6kSFHVr0V0zRX3lfgjoMfaYBlQAirVLWVBni18tTXwjX9S2N/ZTMhD6pOCPi
	OKPYuCmab2TOhMnO56aoRcWi5oKSXi+ukQENL32c0Xq/Iydu2+Qv5hRq3Arw3L+sj0W2oTfg56reT
	1jVvIoICL/c8bQavkQS2S4uq6imkKNLzfL5lh/99P6lFKO/VLxfbAMzmFM3wh4rOr3vWSlPpTploi
	C9HInj6YlmLvZfKX4x+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkT8t-00000009XxJ-0h8g;
	Tue, 18 Feb 2025 19:20:27 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSjV-00000009RnB-4ADT
	for kvm-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 18:54:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739904843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DnTZG95C0zE8RyY1zKQ+qD/dBHRy4z5xNCxkejpwQ44=;
	b=fFb3AswyWQJvNPuIjl/tOKk/kSeXZYLB3S0mqIhzjiZ5v7eU1Oi3wYwFnMSMmzJmXoPrEZ
	VFzW+W37RbstYmPrkGPzrtWzFWYNUEXj3WPrvywSgDJQYNED+lVhG1aEP9+HaLql9gGEYn
	pDD9/uxXSL8U3ZDYZOyWWy33RJgIltQ=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: cleger@rivosinc.com,
	atishp@rivosinc.com
Subject: [kvm-unit-tests PATCH v2 0/3] riscv: sbi: Provide sbiret_report/check
Date: Tue, 18 Feb 2025 19:54:01 +0100
Message-ID: <20250218185401.41250-5-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105414_763548_61549C4E 
X-CRM114-Status: UNSURE (   6.63  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

SXQncyBjb21tb20gZm9yIFNCSSB0ZXN0cyB0byBleHBlY3QgYSBwYXJ0aWN1bGFyIGVycm9yIHJl
dHVybiAob3Igbm8KZXJyb3IsIHdoaWNoIGNhc2UgaXQgZXhwZWN0cyB0aGUgcmV0dXJuZWQgZXJy
b3IgdG8gYmUgU0JJX1NVQ0NFU1MpLgpXaGVuIHdlIGRvbid0IGdldCB0aGUgZXhwZWN0ZWQgZXJy
b3IgaXQnZCBiZSBuaWNlIHRvIG91dHB1dCB3aGF0IHdlCmRpZCBnZXQuIGdlbl9yZXBvcnQoKSBp
biB0aGUgU0JJIHRlc3RzIHdlcmUgZG9pbmcgdGhhdCBmb3IgdGhlIEJBU0UKdGVzdHMsIGltcHJv
dmUgaXQgYW5kIGV4cG9ydCBpdCB0byBiZSB1c2VkIGJ5IGFsbCBTQkkgdGVzdHMuCgp2MjoKIC0g
T3V0cHV0IGV4cGVjdGVkIGVycm9yIHN0cmluZyB3aXRoIHNiaXJldF9yZXBvcnRfZXJyb3IoKSBb
Q2zDqW1lbnRdCiAtIFBpY2tlZCB1cCBDbMOpbWVudCdzIHRhZ3MgZXhjZXB0IGZvciBwYXRjaDMg
c2luY2UgaXQgY2hhbmdlZCBhCiAgIGRlY2VudCBhbW91bnQuCgpBbmRyZXcgSm9uZXMgKDMpOgog
IHJpc2N2OiBzYmk6IEltcHJvdmUgZ2VuX3JlcG9ydAogIHJpc2N2OiBzYmk6IEV4cG9ydCBzYmly
ZXRfcmVwb3J0L2NoZWNrCiAgcmlzY3Y6IHNiaTogQWRkIHNiaXJldF9yZXBvcnRfZXJyb3IKCiBy
aXNjdi9zYmktdGVzdHMuaCB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogcmlzY3Yvc2JpLmMgICAgICAgfCAzMCArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgotLSAK
Mi40OC4xCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
