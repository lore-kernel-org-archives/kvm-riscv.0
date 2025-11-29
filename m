Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F18ECFD2F6
	for <kvm-riscv@archiver.kernel.org>; Sat, 29 Nov 2025 09:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJ0P2zqdDLWRFHXUFn8XEXNX7H58iY5kpI62Af3MvgE=; b=vWPznOgyrfw+av
	YOSQwJdVB2ipUGysvHx0BA3lcbAPvvRELV479yRToP3lC5VRyqy9HkqiLMVzgF+QWleEtaIyT33Yi
	YTnTQ8sohk6lnEfIHFUQlr72J0U3sTw/1IiFUWg0MtCX/JrgUldGAYju/SJR4Gbw7MMIwcgJ719Mp
	Z1YTa2sd6i8QZCEKLadBUcW/RKKosfvw8xG4twk44AGGo1eCfm8tm1c+JWcSiFlSbed1OBl7J5ywV
	t0WuRTcHKQorPiPOVAJPBEaegK7z/Hl5U5OxS3pFrY/YBatoIUUDGG3oFO/i6Uco9xZTr3hQPI0+b
	4Rwpctj59dWGDhAzntTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHD3-00000001QVE-1GxG;
	Sat, 29 Nov 2025 09:25:41 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHD0-00000001QUb-04Ch;
	Sat, 29 Nov 2025 09:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764408332; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=18rum/pY9Ed+XYcJLfQetzjeK0JKcDWxc6EMLCywlk8=;
	b=Y/1rqFamSCTp8+N6nwmIEyjQRDYUsE0PORSqLDfrgb1KWSvrI8NIkZu7kSLL3qSVWXE8UhW2Klawg92/k0l+sy1BpUwqdPgKjlM16kQHFZVYVtw1T2w73BOQSN9o4bP7dr/Y/kenOgSldHupFYuheEdyBsMYB98sJvW9jrJp2Cw=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wtew5QK_1764408328 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 29 Nov 2025 17:25:29 +0800
From: fangyu.yu@linux.alibaba.com
To: rkrcmar@ventanamicro.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv-bounces@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Allow to downgrade HGATP mode via SATP mode
Date: Sat, 29 Nov 2025 17:25:27 +0800
Message-Id: <20251129092527.7502-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <DEHZBIAB842A.1AUCJS0OR923@ventanamicro.com>
References: <DEHZBIAB842A.1AUCJS0OR923@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_012538_828433_69B02A51 
X-CRM114-Status: GOOD (  14.04  )
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

Pj4+PiBPbiBTYXQsIE5vdiAyMiwgMjAyNSBhdCAzOjUw4oCvUE0gPGZhbmd5dS55dUBsaW51eC5h
bGliYWJhLmNvbT4gd3JvdGU6Cj4+Pj4gPgo+Pj4+ID4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUu
eXVAbGludXguYWxpYmFiYS5jb20+Cj4+Pj4gPgo+Pj4+ID4gQ3VycmVudGx5LCBIR0FUUCBtb2Rl
IHVzZXMgdGhlIG1heGltdW0gdmFsdWUgZGV0ZWN0ZWQgYnkgdGhlIGhhcmR3YXJlCj4+Pj4gPiBi
dXQgb2Z0ZW4gc3VjaCBhIHdpZGUgR1BBIGlzIHVubmVjZXNzYXJ5LCBqdXN0IGFzIGEgaG9zdCBz
b21ldGltZXMKPj4+PiA+IGRvZXNuJ3QgbmVlZCBzdjU3Lgo+Pj4+ID4gSXQncyBsaWtlbHkgdGhh
dCBubyBhZGRpdGlvbmFsIHBhcmFtZXRlcnMgKGxpa2Ugbm81bHZsIGFuZCBubzRsdmwpIGFyZQo+
Pj4+ID4gbmVlZGVkLCBhbGlnbmluZyBIR0FUUCBtb2RlIHRvIFNBVFAgbW9kZSBzaG91bGQgbWVl
dCB0aGUgcmVxdWlyZW1lbnRzCj4+Pj4gPiBvZiBtb3N0IHNjZW5hcmlvcy4KPj4+PiBZZXMsIG5v
NS80bHZsIGlzIG5vdCBjbGVhciBhYm91dCBzYXRwIG9yIGhnYXRwLiBTbywgY292ZXJpbmcgSEdQ
QVRQIGlzCj4+Pj4gcmVhc29uYWJsZS4KPj4+Cj4+PlRoZSBkb2N1bWVudGF0aW9uIHNob3VsZCBi
ZSBpbXByb3ZlZCwgYnV0IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBzdGF0ZQo+Pj50aGF0IHRo
ZXNlIHBhcmFtZXRlcnMgYXBwbHkgdG8gYm90aCBzLSBhbmQgZy1zdGFnZS4gSWYgd2UgbmVlZCBw
YXJhbWV0ZXJzCj4+PnRvIGRpY3RhdGUgS1ZNIGJlaGF2aW9yIChnLXN0YWdlIG1hbmFnZW1lbnQp
LCB0aGVuIHdlIHNob3VsZCBhZGQgS1ZNCj4+Pm1vZHVsZSBwYXJhbWV0ZXJzLgo+Pgo+PiBSaWdo
dCwgYWRkaW5nIG5ldyBwYXJhbWV0ZXJzIGZvciBnLXN0YWdlIG1hbmFnZW1lbnQgaXMgY2xlYXIu
Cj4+Cj4+IE9yIHdlIGNvdWxkIGRpc2N1c3MgdGhpcyB0b3BpYywgZnJvbSBhIHZpcnR1YWwgbWFj
aGluZSBwZXJzcGVjdGl2ZSwKPj4gaXQgbWF5IG5vdCBiZSBuZWNlc3NhcnkgdG8gcHJvdmlkZSBh
bGwgaGFyZHdhcmUgY29uZmlndXJhdGlvbgo+PiBjb21iaW5hdGlvbnMuIEZvciBleGFtcGxlLCB3
aGVuIFNBVFAgaXMgY29uZmlndXJlZCBhcyBzdjQ4LAo+PiBjb25maWd1cmluZyBIR0FUUCBhcyBz
djU3KjQgaXMgbm90IHZlcnkgbWVhbmluZ2Z1bCwgQmVjYXVzZSB0aGUKPj4gVk0gY2Fubm90IGFj
dHVhbGx5IHVzZSBtb3JlIHRoYW4gNDggYml0cyBvZiBHUEEgcmFuZ2UuCj4KPlRoZSBjaG9pY2Ug
b2YgaGdhdHAgbW9kZSBkZXBlbmRzIG9uIGhvdyB1c2VycyBjb25maWd1cmUgZ3Vlc3QncyBtZW1v
cnkKPm1hcCwgcmVnYXJkbGVzcyBvZiB3aGF0IHNhdHAgb3IgdnNhdHAgbW9kZXMgYXJlLgo+KEFs
bCBSVjY0IFN2WFkgbW9kZXMgbWFwIFhZIGJpdCBWQSB0byA1NiBiaXQgUEEuKQo+Cj5JZiB0aGUg
bWFjaGluZSBtb2RlbCBtYXBzIG1lbW9yeSB3aXRoIHNldCBiaXQgNTUsIHRoZW4gS1ZNIG5lZWRz
IHRvCj5jb25maWd1cmUgU3Y1N3g0LCBhbmQgaWYgbm90aGluZyBpcyBtYXBwZWQgYWJvdmUgMiBU
aUIsIHRoZW4gS1ZNIGlzCj5jb21wbGV0ZWx5IGZpbmUgd2l0aCBTdjM5eDQuCj4KPkEgbW9kdWxl
IHBhcmFtZXRlciB3b3JrcywgYnV0IEkgdGhpbmsgaXQgd291bGQgYmUgbmljZXIgdG8gc2V0IHRo
ZSBoZ2F0cAo+bW9kZSBwZXItVk0sIGJlY2F1c2UgbW9zdCBWTXMgY291bGQgdXNlIHRoZSBlZmZp
Y2llbnQgU3YzOXg0LCB3aGlsZSBpdCdzCj5ub3QgYSBnb29kIGlkZWEgdG8gcGljayBpdCBhcyB0
aGUgZGVmYXVsdC4KPkkgdGhpbmsgS1ZNIGhhcyBlbm91Z2ggaW5mb3JtYXRpb24gdG8gZG8gaXQg
YXV0b21hdGljYWxseSAoYW5kIHdpdGhvdXQKPnRvbyBtdWNoIGNvbXBsZXhpdHkpIGJ5IHN0YXJ0
aW5nIHdpdGggU3YzOXg0LCBhbmQgZXhwYW5kaW5nIGFzIG5lZWRlZC4KPgoKSXQgZG9lcyBzZWVt
IG1vcmUgcmVhc29uYWJsZSB0byBzZWxlY3QgdGhlIEhHQVRQIG1vZGUgZm9yIGVhY2ggVk0gYmFz
ZWQKb24gdGhlIGFjdHVhbCByZXF1aXJlZCBHUEEgcmFuZ2UuCkkgd2lsbCBzZW5kIGFuIHVwZGF0
ZWQgcGF0Y2ggYmFzZWQgb24gdGhpcyBzdWdnZXN0aW9uLgoKVGhhbmtzLApGYW5neXUKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
