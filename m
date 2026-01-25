Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E234E63CA1
	for <kvm-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyeMjTqfVW7I/1G9wNZzkwTCXrqQgPkf3B3hQ+vik+A=; b=S4LI4vwYnuKCLt
	6WlUskaBObCCm2hJqqHrYqSoWngHwntE3AzK8AM9uPZ69F7cKVCiIOYhHPFakd7N8M18J98nATs+d
	2o6tSWmIQa02jt83KgrTqoLBt0E2o71zJJ7Kq7NzwZfbrd5DwUH4n85+hxxSYbvXhuEzU36+vnyPv
	4rX5de7lm8igvRQJbV5kcZSHGpKZpA9TbhV2QSFPEPwZg1EZmyhYAzh+vIlIHoxAnOg2AYrNI6iGa
	m/j/p+QU5Rn8mWVMQ5qFW5Luryf01J+TG/Jt4mfxlyKfwDdHEmbQ1xndhBc7WXehW5dFFZxX7AfEl
	ha11dBNeJk2a+i9F0Kww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyJy-0000000B7bX-2wPC;
	Sun, 25 Jan 2026 11:30:22 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyJv-0000000B7aj-36J8;
	Sun, 25 Jan 2026 11:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769340613; x=1769945413; i=markus.elfring@web.de;
	bh=tdtiBF4T91dfh0BQrU6+nIC8DtSKwATIf7f2cvsu8+4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=J57+U98PT9+yfwwMtfWT+eElnOLUHBSoIZSkbW9QlRrSrgqnQuccyw2Y/gFX+AeF
	 l1gaFrPmd+tTYrsiAKEgnaf9Kabfe4WsU0XT9ODZMZNi3qp+5niBxuAmT4Fy77GU5
	 TDOpWUKAZSP/8946E/v1YRZvCHCl1/Yr4xg8JmD4oniu8PdeHxnqSOKi+Wl3JdJUz
	 WVdhChOUH0PpgJkGAUEjNr7B1pXgcCpBdrTwN6MvX2QNLFDV99QOvmHK8RGIiO3G7
	 5AfZCzoevi7btM4cWA0bJd+223im2GbGGL1eeCCLamd4gRp8ubN03P6rD8HPww88e
	 pA2RXPJ0dc0WBHCiEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.242]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N943B-1vnHbG02KN-00x6UE; Sun, 25
 Jan 2026 12:30:13 +0100
Message-ID: <9a818ca6-04fc-434c-b8eb-8380d5bb2293@web.de>
Date: Sun, 25 Jan 2026 12:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Cc: Jiakai Xu <jiakaipeanut@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
References: <20260125085157.2462296-1-xujiakai2025@iscas.ac.cn>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix null pointer dereference in
 kvm_riscv_aia_imsic_has_attr
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260125085157.2462296-1-xujiakai2025@iscas.ac.cn>
X-Provags-ID: V03:K1:vmKBZwfSFE7bkYKLyzwaV/BhZpt9Y51fIuVJ7ZJXaL0aq83Q8uF
 yhXWZMaOHqw11F92ojK2NTN/KlmKt7W3hRW/wxHKrdYq8+5U1in7C1oUUZVNVAMPtXe+wKO
 Kk6WHXkFHKeqDv1stOJEdij1INlFZmFW49etRBld3H1BfSNztrFbNOgIuwx6K6KxJNCpNp2
 Fg69XD2HPdrWoHnnrmBLQ==
UI-OutboundReport: notjunk:1;M01:P0:bq48/caCZq0=;B/IN5suMLN2/ZE+7PPQ7w9LLk3h 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 M95TqgJQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_033020_194752_CD0CDD61 
X-CRM114-Status: UNSURE (   6.99  )
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

4oCmCj4gVGhlIGZpeCBhZGRzIGEgY2hlY2sgdG8gcmV0dXJuIC1FTk9ERVYgaWYgaW1zaWNfc3Rh
dGUgaXMgTlVMTCwgd2hpY2gKPiBpcyBjb25zaXN0ZW50IHdpdGggb3RoZXIgZXJyb3IgaGFuZGxp
bmcgaW4gdGhlIGZ1bmN0aW9uIGFuZCBwcmV2ZW50cwo+IHRoZSBudWxsIHBvaW50ZXIgZGVyZWZl
cmVuY2UuCgpIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIG1vdmUgdGhlIGFzc2lnbm1lbnQgZm9y
IHRoZSBsb2NhbCB2YXJpYWJsZSDigJxpc2Vs4oCdCmJlaGluZCB0aGlzIGNoZWNrIGJ5IGFub3Ro
ZXIgdXBkYXRlIHN0ZXA/Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE5LXJj
NS9zb3VyY2UvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMjTDk4Mi1MOTk5CgoKPiB2MjogYWRk
IEZpeGVzIHRhZyBhbmQgZHJvcCBleHRlcm5hbCBsaW5rIGFzIHN1Z2dlc3RlZC4KClBsZWFzZSBt
b3ZlIGEgcGF0Y2ggdmVyc2lvbiBkZXNjcmlwdGlvbiBiZWhpbmQgdGhlIG1hcmtlciBsaW5lLgpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJz
dD9oPXY2LjE5LXJjNiNuNzg1CgoKV291bGQgaXQgYmUgaGVscGZ1bCB0byBhcHBlbmQgcGFyZW50
aGVzZXMgdG8gYSBmdW5jdGlvbiBuYW1lIGFsc28gaW4gdGhlIHN1bW1hcnkgcGhyYXNlPwoKUmVn
YXJkcywKTWFya3VzCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
