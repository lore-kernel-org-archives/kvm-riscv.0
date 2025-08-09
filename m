Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BEC87FCB
	for <kvm-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 03:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVmRqRNMaQiKcmQ89IE1deaz0DyrqgmV32WR5J15xOw=; b=DIGOACMvZrkzZ0
	xpm3010BWpymNrKZ7sf0arA1QenZafBC6t3oGTDppbtr6oTnO9QvNpx0cFjsCUu5Hp7hzsSIWIS4I
	pfPsQ3oC6TQ6fI//okPp3Mtn/aeNcio0+wkJHy1pzYGKV4s+1Rn+AxamaGS55yxVaNLGMNJl/h3Y6
	jjRUVIeoOeQK7HA66EE9IEPdBXLAv0SGg93gxtCnI6qdmq6qHy34qLCFGmqRw4mHcXCsystOo3BIm
	PUSDA1rQXiM0JUESWMV4Xcuw75VJeXiInwO1NDQCnPkFI+siwtjTyg7cSaFkUbN3MQAL4hyJpViNg
	5D1FzfRenVnw7VIOc7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uka8N-000000042oi-4C21;
	Sat, 09 Aug 2025 03:20:40 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uka8K-000000042o7-2N0F;
	Sat, 09 Aug 2025 03:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1754709628; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=XH3EkbdWVrqttexIEF23qR/7W6J8fXZ+aOIZNR/WZ4k=;
	b=AlXDr7C2LBugKgGd3dfh3VJdNxZlPkXpfokrg4alyQ9ch3hbzK8I2JeT42/ICTmWubqtOtXemA2NBZVo0txQcm1HcbLfQTQujh4JE64nS3gyahnS59oOI2F12VaCm2s5n/fBsFazJmAT0Zwv+E/tCIwDrdIhVSw/MEJ3e2AR5ag=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WlItg7x_1754709625 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 09 Aug 2025 11:20:27 +0800
From: fangyu.yu@linux.alibaba.com
To: rkrcmar@ventanamicro.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@linux.alibaba.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv-bounces@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH] RISC-V: KVM: Using user-mode pte within kvm_riscv_gstage_ioremap
Date: Sat,  9 Aug 2025 11:20:20 +0800
Message-Id: <20250809032020.51380-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <DBX0JNR61UNM.Z42YERAKRFR8@ventanamicro.com>
References: <DBX0JNR61UNM.Z42YERAKRFR8@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_202037_219679_3BED1880 
X-CRM114-Status: GOOD (  13.05  )
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

Pj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4+Cj4+IEN1
cnJlbnRseSB3ZSB1c2Uga3ZtX3Jpc2N2X2dzdGFnZV9pb3JlbWFwIHRvIG1hcCBJTVNJQyBncGEg
dG8gdGhlIHNwYSBvZgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeXl4KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHBhPwo+CgpZZXMsIEkg
dGhpbmsgdGhleSBtZWFuIHRoZSBzYW1lIHRoaW5nLCBSSVNDLVYgSU9NTVUgU3BlYyBkZWZpbmVz
IHNwYQooU3VwZXJ2aXNvciBQaHlzaWNhbCBBZGRyZXNzKS4KCj4+IGd1ZXN0IGludGVycnVwdCBm
aWxlIHdpdGhpbiBJTVNJQy4KPj4KPj4gVGhlIFBBR0VfS0VSTkVMX0lPIHByb3BlcnR5IGRvZXMg
bm90IGluY2x1ZGUgdXNlciBtb2RlIHNldHRpbmdzLCBzbyB3aGVuCj4+IGFjY2Vzc2luZyB0aGUg
SU1TSUMgYWRkcmVzcyBpbiB0aGUgdmlydHVhbCBtYWNoaW5lLCAgYSAgZ3Vlc3QgcGFnZSBmYXVs
dAo+PiB3aWxsIG9jY3VyLCB0aGlzIGlzIG5vdCBleHBlY3RlZC4KPgo+UEFHRV9LRVJORUxfSU8g
YWxzbyBzZXQgdGhlIHJlc2VydmVkIEcgYml0LCBzbyB5b3UncmUgZml4aW5nIHR3byBpc3N1ZXMK
PndpdGggYSBzaW5nbGUgY2hhbmdlLiA6KQo+CgpSaWdodCwgVGhlIEcgYml0IGluIGFsbCBHLXN0
YWdlIFBURXMgaXMgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSBzdGFuZGFyZCB1c2UuCgo+PiBBY2NvcmRp
bmcgdG8gdGhlIFJJU0MtViBQcml2aWxlZ2VkIEFyY2hpdGVjdHVyZSBTcGVjLCBmb3IgRy1zdGFn
ZSBhZGRyZXNzCj4+IHRyYW5zbGF0aW9uLCBhbGwgbWVtb3J5IGFjY2Vzc2VzIGFyZSBjb25zaWRl
cmVkIHRvIGJlIHVzZXItbGV2ZWwgYWNjZXNzZXMKPj4gYXMgdGhvdWdoIGV4ZWN1dGVkIGluIFVt
b2RlLgo+Cj5XaGF0IGltcGxlbWVudGF0aW9uIGFyZSB5b3UgdXNpbmc/ICBJIHdvdWxkIGhhdmUg
YXNzdW1lIHRoYXQgdGhlCj5vcmlnaW5hbCBjb2RlIHdhcyB0ZXN0ZWQgb24gUUVNVSwgc28gd2Ug
bWlnaHQgaGF2ZSBhIGJ1ZyB0aGVyZS4KPgoKVGhpcyBpc3N1ZSBjYW4gYmUgcmVwcm9kdWNlZCB1
c2luZyBRRU1VLgpTaW5jZSBrdm0gaGFzIHJlZ2lzdGVyZWQgdGhlIE1NSU8gQnVzIGZvciBJTVNJ
QyBncGEsIHdoZW4gYSBndWVzdApwYWdlIGZhdWx0IG9jY3VycywgaXQgd2lsbCBjYWxsIHRoZSBp
bXNpY19tbWlvX3dyaXRlIGZ1bmN0aW9uLHRoZQpndWVzdCBpcnEgd2lsbCBiZSB3cml0dGVuIHRv
IHRoZSBndWVzdCBpbnRlcnJ1cHQgZmlsZSBieSBrdm0uCgo+PiBTaWduZWQtb2ZmLWJ5OiBGYW5n
eXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPj4gLS0tCj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4+IEBAIC0zNTks
OCArMzYwLDExIEBAIGludCBrdm1fcmlzY3ZfZ3N0YWdlX2lvcmVtYXAoc3RydWN0IGt2bSAqa3Zt
LCBncGFfdCBncGEsCj4+ICAJZW5kID0gKGdwYSArIHNpemUgKyBQQUdFX1NJWkUgLSAxKSAmIFBB
R0VfTUFTSzsKPj4gIAlwZm4gPSBfX3BoeXNfdG9fcGZuKGhwYSk7Cj4+ICAKPj4gKwlwcm90ID0g
cGdwcm90X25vbmNhY2hlZChQQUdFX1dSSVRFKTsKPj4gKwo+PiAgCWZvciAoYWRkciA9IGdwYTsg
YWRkciA8IGVuZDsgYWRkciArPSBQQUdFX1NJWkUpIHsKPj4gLQkJcHRlID0gcGZuX3B0ZShwZm4s
IFBBR0VfS0VSTkVMX0lPKTsKPj4gKwkJcHRlID0gcGZuX3B0ZShwZm4sIHByb3QpOwo+PiArCQlw
dGUgPSBwdGVfbWtkaXJ0eShwdGUpOwo+Cj5JcyBpdCBuZWNlc3NhcnkgdG8gZGlydHkgdGhlIHB0
ZT8KPgo+SXQgd2FzIGRpcnRpZWQgYmVmb3JlLCBzbyBpdCBkZWZpbml0ZWx5IGRvZXNuJ3QgaHVy
dCwKPgoKTWFrZSBwdGUgZGlydHkgaXMgbmVjZXNzYXJ5KGZvciBoYXJkd2FyZSB3aXRob3V0IFN2
YWR1KSwgYW5kIGhlcmUgaXMKdGhlIGZpcnN0IHRpbWUgdG8gbWFrZSB0aGlzIHB0ZSBkaXJ0eS4K
Cj5SZXZpZXdlZC1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+
Cj4KPlRoYW5rcy4KClRoYW5rcywKZmFuZ3l1CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
