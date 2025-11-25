Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E8FD0E6ED
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcOmTa3rL03AiCWG/lrwo6azgMGgsYfVqH8DikNn154=; b=QSR/WLdcz6xIhu
	ZvgP8KgeyYlIVrbkI9CeNRHmlc4BsIVEhwCKtW9k+4/8O/EmaFQoHxio+1g6MhWCC+qohGHMqCkN3
	tKk7c0PlkBNLq5ZdVHloN1Tc5SUoMUVZ+u/Uz/xbxtI+rCor1qV8z1QiwrzJDXxUMhnnQpM1Jr2WA
	NWZnNomAlfB8Z9KOrH1OBAu0C1DTXuuxGNBhEWgq/7honVSTTJIt1O0lPoMC8AjMYMWSxySz4mS3O
	sxdyTobayxZySPma32UAaDG04pYiYtwtoYZbpqaoyyBz5PZb6djtRjeEC/BmLazk6BiLO+cqNFJSQ
	4Y4imOzIJcqETmhpHrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtsD-0000000DPzE-2qx8;
	Tue, 25 Nov 2025 14:18:29 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtsA-0000000DPyW-0Blq;
	Tue, 25 Nov 2025 14:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764080299; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=/nLaQgrfgV1fF/s4cxpU8v6u4Dcf3qSsNdZfhEYMj+8=;
	b=V2jYG/5Cvr1O9l79u596rCyKKSp4rBVcfjQLfwct+op2S3UZETIKIt3PJ3KM9xFkADXyXkPahlOBbxmFT0GAucb/HP6pUGGZDS+Fp0SGvEkQoUGgNecgnaI0Pm44tduBE2VXUYJjhwITJ6dv3Q6c7/RPNV8j1eGOg5trqqmbEyk=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WtOKGV7_1764080296 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 25 Nov 2025 22:18:17 +0800
From: fangyu.yu@linux.alibaba.com
To: ajones@ventanamicro.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Allow to downgrade HGATP mode via SATP mode
Date: Tue, 25 Nov 2025 22:18:11 +0800
Message-Id: <20251125141811.39964-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251124-4ecf1b6b91b8f0688b762698@orel>
References: <20251124-4ecf1b6b91b8f0688b762698@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_061826_758439_A6BB7BAB 
X-CRM114-Status: GOOD (  10.41  )
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

Pj4gT24gU2F0LCBOb3YgMjIsIDIwMjUgYXQgMzo1MOKAr1BNIDxmYW5neXUueXVAbGludXguYWxp
YmFiYS5jb20+IHdyb3RlOgo+PiA+Cj4+ID4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGlu
dXguYWxpYmFiYS5jb20+Cj4+ID4KPj4gPiBDdXJyZW50bHksIEhHQVRQIG1vZGUgdXNlcyB0aGUg
bWF4aW11bSB2YWx1ZSBkZXRlY3RlZCBieSB0aGUgaGFyZHdhcmUKPj4gPiBidXQgb2Z0ZW4gc3Vj
aCBhIHdpZGUgR1BBIGlzIHVubmVjZXNzYXJ5LCBqdXN0IGFzIGEgaG9zdCBzb21ldGltZXMKPj4g
PiBkb2Vzbid0IG5lZWQgc3Y1Ny4KPj4gPiBJdCdzIGxpa2VseSB0aGF0IG5vIGFkZGl0aW9uYWwg
cGFyYW1ldGVycyAobGlrZSBubzVsdmwgYW5kIG5vNGx2bCkgYXJlCj4+ID4gbmVlZGVkLCBhbGln
bmluZyBIR0FUUCBtb2RlIHRvIFNBVFAgbW9kZSBzaG91bGQgbWVldCB0aGUgcmVxdWlyZW1lbnRz
Cj4+ID4gb2YgbW9zdCBzY2VuYXJpb3MuCj4+IFllcywgbm81LzRsdmwgaXMgbm90IGNsZWFyIGFi
b3V0IHNhdHAgb3IgaGdhdHAuIFNvLCBjb3ZlcmluZyBIR1BBVFAgaXMKPj4gcmVhc29uYWJsZS4K
Pgo+VGhlIGRvY3VtZW50YXRpb24gc2hvdWxkIGJlIGltcHJvdmVkLCBidXQgSSBkb24ndCB0aGlu
ayB3ZSB3YW50IHRvIHN0YXRlCj50aGF0IHRoZXNlIHBhcmFtZXRlcnMgYXBwbHkgdG8gYm90aCBz
LSBhbmQgZy1zdGFnZS4gSWYgd2UgbmVlZCBwYXJhbWV0ZXJzCj50byBkaWN0YXRlIEtWTSBiZWhh
dmlvciAoZy1zdGFnZSBtYW5hZ2VtZW50KSwgdGhlbiB3ZSBzaG91bGQgYWRkIEtWTQo+bW9kdWxl
IHBhcmFtZXRlcnMuCgpSaWdodCwgYWRkaW5nIG5ldyBwYXJhbWV0ZXJzIGZvciBnLXN0YWdlIG1h
bmFnZW1lbnQgaXMgY2xlYXIuCgpPciB3ZSBjb3VsZCBkaXNjdXNzIHRoaXMgdG9waWMsIGZyb20g
YSB2aXJ0dWFsIG1hY2hpbmUgcGVyc3BlY3RpdmUsCml0IG1heSBub3QgYmUgbmVjZXNzYXJ5IHRv
IHByb3ZpZGUgYWxsIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24KY29tYmluYXRpb25zLiBGb3IgZXhh
bXBsZSwgd2hlbiBTQVRQIGlzIGNvbmZpZ3VyZWQgYXMgc3Y0OCwKY29uZmlndXJpbmcgSEdBVFAg
YXMgc3Y1Nyo0IGlzIG5vdCB2ZXJ5IG1lYW5pbmdmdWwsIEJlY2F1c2UgdGhlClZNIGNhbm5vdCBh
Y3R1YWxseSB1c2UgbW9yZSB0aGFuIDQ4IGJpdHMgb2YgR1BBIHJhbmdlLgoKVGhhbmtzLApGYW5n
eXUKPlRoYW5rcywKPmRyZXcKCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
