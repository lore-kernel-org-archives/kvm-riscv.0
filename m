Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6B5C02198
	for <kvm-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:Message-Id:Mime-Version:From
	:To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qmHWefhTIrWKETf0an9CmvvZB8FIpe8KPNY3VWBTxHY=; b=EKrFHnEipjEqzx
	tXrjB21StbWjDeZ21zE4A7Dfi/Xdw7dJMQ6GCSp5+Waw7HKIh6S0vnLXuXaTPZVy0oE839LLk9zUF
	4nSp922PSlGH593pHS6JwklYKlvVPIRYvq9csYB8WHISPJ+uoUkUFE/4G+GOZqTTraMtnXoii/wlm
	aGVy+W9m3ZzPvw9MlI/UtiC0pXX3xrTixz4EYGphRXUeUrnhA+WX+ntybMFDkdr5eJ5JBpKZfhDMV
	EXBRnGY75eCqp99HHZJvrHy8ARoW58X9di1viaN5ELT+5RXXDV2fRhD1kuwrfpibtS6ueMYguXmwm
	c8UPhBayac9hHzmGaB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIgg-00000007BvN-34G3;
	Tue, 18 Feb 2025 08:10:38 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIX0-00000007AK2-0lnA
	for kvm-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 08:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1739865627;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MMO+Pgdg8WUeZitp0y2WePnN5QHq5BURFZjY8A/MeFs=;
 b=Z2aH6/8CrVCpu9NtMyfc9p0Q5oAdZWHEBbQYGKCrg6wQR3tVN3hiIRpT7CclZQiYu9H8A2
 a2UGYxq4on4qGPxKSUOexkslLkeDC6W4cpTDLZfEKgO7S2WMxtucEJ9FehcVGtmFjeAiYN
 kjG4l9CYzaagPWUqDJkyEkQ9DPXHrI+B6KEm4hUKVHz+eQMHxcxtS6eLACjTw5nT4WCo0v
 zID8WhTSDTLXp0CsEnlRlcEqOJZp00c+4+MmRAmE20rlIGs2vL6e/HU8WOjCNB1RDShUpH
 12+4ZSwWTuHc6Z+xKOJRZsCkzzCizyNxg2zvDFz9Nfjf0/9kH05i/p+46ay2dQ==
Date: Tue, 18 Feb 2025 16:00:24 +0800
To: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>
From: =?utf-8?q?=E9=A1=B9=E6=96=87=E6=88=90?= <xiangwencheng@lanxincomputing.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+167b43e19+4dfd17+lists.infradead.org+xiangwencheng@lanxincomputing.com>
Message-Id: <38cc241c40a8ef2775e304d366bcd07df733ecf0.1d66512d.85e4.41a5.8cf7.4c1fdb05d775@feishu.cn>
Cc: "anup@brainfault.org" <anup@brainfault.org>, 
	"atishp@atishpatra.org" <atishp@atishpatra.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_000038_875083_5319F0CE 
X-CRM114-Status: UNSURE (   7.52  )
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

RnJvbSAzMGRkMDBmNjg4NjExOWVjYzVjMzliNmI4OGY4NjE3YTU3ZTU5OGZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCaWxsWGlhbmcgPHhpYW5nd2VuY2hlbmdAbGFueGluY29tcHV0
aW5nLmNvbT4KRGF0ZTogVHVlLCAxOCBGZWIgMjAyNSAxNTo0NTo1MiArMDgwMApTdWJqZWN0OiBb
UEFUQ0hdIHJpc2N2OiBLVk06IFJlbW92ZSB1bm5lY2Vzc2FyeSB2Y3B1IGtpY2sKCkhlbGxvIGV2
ZXJ5b25lLApJJ20gd29uZGVyaW5nIHdoZXRoZXIgaXQncyBuZWNlc3NhcnkgdG8ga2ljayB0aGUg
dmlydHVhbCBoYXJ0CmFmdGVyIHdyaXRpbmcgdG8gdGhlIHZzZmlsZSBvZiBJTVNJQy4KRnJvbSBt
eSB1bmRlcnN0YW5kaW5nLCB3cml0aW5nIHRvIHRoZSB2c2ZpbGUgc2hvdWxkIGRpcmVjdGx5CmZv
cndhcmQgdGhlIGludGVycnVwdCBhcyBNU0kgdG8gdGhlIHZpcnR1YWwgaGFydC4gVGhpcyBtZWFu
cyB0aGF0CmFuIGFkZGl0aW9uYWwga2ljayBzaG91bGQgbm90IGJlIG5lY2Vzc2FyeSwgYXMgaXQg
d291bGQgY2F1c2UgdGhlCnZDUFUgdG8gZXhpdCB1bm5lY2Vzc2FyaWx5IGFuZCBwb3RlbnRpYWxs
eSBkZWdyYWRlIHBlcmZvcm1hbmNlLgpJJ3ZlIHRlc3RlZCB0aGlzIGJlaGF2aW9yIGluIFFFTVUs
IGFuZCBpdCBzZWVtcyB0byB3b3JrIHBlcmZlY3RseQpmaW5lIHdpdGhvdXQgdGhlIGV4dHJhIGtp
Y2suCldvdWxkIGFwcHJlY2lhdGUgYW55IGluc2lnaHRzIG9yIGNvbmZpcm1hdGlvbiBvbiB0aGlz
IQpCZXN0IHJlZ2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBCaWxsWGlhbmcgPHhpYW5nd2VuY2hlbmdA
bGFueGluY29tcHV0aW5nLmNvbT4KLS0tCsKgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCAx
IC0KwqAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKaW5kZXggYTgw
ODVjZDgyMTVlLi4yOWVmOWMyMTMzYTkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9p
bXNpYy5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCkBAIC05NzQsNyArOTc0LDYg
QEAgaW50IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19pbmplY3Qoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAoKwqDCoCDCoCDCoMKgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+PSAwKSB7CsKgwqAgwqAg
wqAgwqAgwqAgwqAgwqDCoCB3cml0ZWwoaWlkLCBpbXNpYy0+dnNmaWxlX3ZhICsgSU1TSUNfTU1J
T19TRVRJUE5VTV9MRSk7Ci0gwqAgwqAgwqAgwqAgwqAgwqAgwqAga3ZtX3ZjcHVfa2ljayh2Y3B1
KTsKwqDCoCDCoCDCoMKgIH0gZWxzZSB7CsKgwqAgwqAgwqAgwqAgwqAgwqAgwqDCoCBlaXggPSAm
aW1zaWMtPnN3ZmlsZS0+ZWl4W2lpZCAvIEJJVFNfUEVSX1RZUEUodTY0KV07CsKgwqAgwqAgwqAg
wqAgwqAgwqAgwqDCoCBzZXRfYml0KGlpZCAmIChCSVRTX1BFUl9UWVBFKHU2NCkgLSAxKSwgZWl4
LT5laXApOwotLQoyLjQ2LjIKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
