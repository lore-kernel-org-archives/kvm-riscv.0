Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D14C2A06C
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07m5+QGrE+pnBdBBfZzY2ELoseBufCl/inX3mSbwrys=; b=C1+zpegw6/4pWm
	XI/ABifK5P7kSut04+Yb1nJgclog+C3TsWu4a0k/UiAMPceK1wmtjfc2rloSy+lN2PC3Ajj0aIo3i
	B0mkxTspLeWAAysBf71qqCTwlPHzNbMu+r0ZsYVrSK5VAMwT5E37jljUWhKDnSsq6kXsDWHuKrgKe
	uq0xFqVWlostWZvA61PTPumtSEnLYqyHNzt8sdsEn9TijiYwxxnxDqh5pEGgUXAz9mXUJ+bboa7gQ
	X1b8XmHAcGqEmubXrMIL41ZDKeC2Ac+oX6YWBs32L+T7X8xLjLzMB5XbMKBazoZOlLpKlobbx41le
	kC2l0WitpbTf0gq2Gxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcNyD-0000000AFY8-1HBZ;
	Sun, 04 Jan 2026 13:16:33 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcNy9-0000000AFXL-3d49
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 13:16:30 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-3fe3cc80bc3so4588614fac.0
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 05:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767532588; x=1768137388; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kpw5c66615tZNKatmV43J/ND8KGZ/2GF5fblepdu7i8=;
        b=bJnXtNXik5965gTtKuBGLJ3lT2hCukPhVKu3X/8M5+V0NQl2P5FlXetUNxoAgH0QvL
         nJq6+uVxfw6CjIT1jNTKMKvDRr1aEqCU61NtwPAo5bY0qZvNz67Lxm6whnTacTzN0v4S
         g38lwqWHg+VGvPLFW06wn55yDke3okvglasU/Gh8/O/3AOG4nbmzNs9ufmlT7aOXKG5x
         iIrm11VBGlxML/xnGGuNHuJ2cSZA+VdKYKhcDSm98tLDWwGpdQ0qN7hf5AolO97s/wbf
         OL1AYTcY55JD7I6oYT7/5iuRFxAdyyeaEFIUE5Vez4GkU3VNPUpjKHh5MnqVG+upK3gz
         IqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767532588; x=1768137388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kpw5c66615tZNKatmV43J/ND8KGZ/2GF5fblepdu7i8=;
        b=CYv3QLUxgtqatUr5lpytkCL7/pljwK6qip+UtgTF9k3ulnjNF1nbRQr94qUXbvG5Bj
         zJkS+RD8HHPdjlFoEcDel6o7U8bspxvks6XpEp1gMpmN0Rd+QKkrf9nqo6bi4k90JhkK
         dCE05bvPfQ05tK7vH53oUU8KRdC4wycoe9zLzkTvL189DfdmfGh4a47xZyG6zcjrWRY7
         TQy2JX3KJgD/x6EutkulZP7zBN5YCegyvQnwZ6MQpXkg5NksR7SekOjrF4s+H6b5FEzU
         i/wjNiG7t7XPZoqJm6TnwSoIGma+taxiLisiQYwQ27fqUcAW/XeWk9BayELnEIzTAYhC
         TAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1XJj1AZNk0SGYWhdhXXWGb/DDI1uOo1add0ebD5YEvDQKB/z5pBbwJsMx48B6kOnuJZ+s5VGGlNA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfxbYVsiudttme2QO+Ksep7KZpJTe5HTZkMmIH8yZBPD8mVeyX
	wUJ4RJyG9NYGRfsi23mjjOmNXgrG2z0U3u+LVfm36KiyeTt/vvj32D8ipawJ7bMX6dPTrGMdScM
	AYgN3+8MULybNFFWiT+FusImDh7C2V2EqhMEoXLdSIA==
X-Gm-Gg: AY/fxX40Cb7m1kmSnulrBOXgNfF0DlutnJRHkrBnL4kqazZfx5fnwvRzIxwHx5WvHX+
	Nmv9mXDNbS+uXoUhVA4jVnpGdCOAiiAHWQhuwPLomKV1UqItDpF3Y+Gcc4Tv/5az9xHMOAoUvbM
	Hk44dIWoF8FqisXMLrxuhQNvWdX+ro5ZShefPPd7P4KNAQXtr9LxfQL3KpdE4AQXYKNIgaXOgFB
	c46Zjg1b/dhOER5dHhojhDXC2iiE4PsQFi8XSdsMF2qartK4DfjXdhtnZsKhcy436e+EWG1cSSV
	fLy4CUzNQG+Xu9v1lP6h3xLVXy+sPSOpSzmOY6swXZaG7GD6eFp5nav6/LQVvL7OplY+
X-Google-Smtp-Source: AGHT+IGT244la+14L6U18Uxy9GYJPnBgP9sTDS9KacVXfRCEDc5zScFpVVMALlU5LWz1Jl7huKZAKKZcDb8ssT4GVXY=
X-Received: by 2002:a4a:d676:0:b0:65f:fec:9d73 with SMTP id
 006d021491bc7-65f0fecac13mr3549160eaf.31.1767532588514; Sun, 04 Jan 2026
 05:16:28 -0800 (PST)
MIME-Version: 1.0
References: <20251222093718.26223-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251222093718.26223-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Jan 2026 18:46:17 +0530
X-Gm-Features: AQt7F2p6TPTBqgurXOAwdOn8HSUO6amlD4OSN8ElokLgnxoYr3h1zNDHtjswIrA
Message-ID: <CAAhSdy0dcMhmENZ9cMkE7Rh8u93sRiYozxEWgJ0tvHVUiRdykw@mail.gmail.com>
Subject: Re: [PATCH v4] irqchip/riscv-imsic: Adjust the number of available
 guest irq files
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_051629_926381_6D155AFF 
X-CRM114-Status: GOOD (  25.61  )
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

T24gTW9uLCBEZWMgMjIsIDIwMjUgYXQgMzowN+KAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgS1ZNIGFzc3VtZXMgdGhlIG1pbmltdW0g
b2YgaW1wbGVtZW50ZWQgSEdFSUUgYml0cyBhbmQKPiAiQklUKGdjLT5ndWVzdF9pbmRleF9iaXRz
KSAtIDEiIGFzIHRoZSBudW1iZXIgb2YgZ3Vlc3QgZmlsZXMgYXZhaWxhYmxlCj4gYWNyb3NzIGFs
bCBDUFVzLiBUaGlzIHdpbGwgbm90IHdvcmsgd2hlbiBDUFVzIGhhdmUgZGlmZmVyZW50IG51bWJl
cgo+IG9mIGd1ZXN0IGZpbGVzIGJlY2F1c2UgS1ZNIG1heSBpbmNvcnJlY3RseSBhbGxvY2F0ZSBh
IGd1ZXN0IGZpbGUgb24gYSBDUFUKPiB3aXRoIGZld2VyIGd1ZXN0IGZpbGVzLgo+Cj4gVG8gYWRk
cmVzcyBhYm92ZSwgZHVyaW5nIGluaXRpYWxpemF0aW9uLCB3ZSBjYWxjdWxhdGUgdGhlIG51bWJl
ciBvZgoKLywgd2UgY2FsY3VsYXRlIC4uLi8sIGNhbGN1bGF0ZSAuLi4vCgo+IGF2YWlsYWJsZSBn
dWVzdCBpbnRlcnJ1cHQgZmlsZXMgYWNjb3JkaW5nIHRvIE1NSU8gcmVzb3VyY2VzIGFuZCBjb25z
dHJhaW4KPiB0aGUgbnVtYmVyIG9mIGd1ZXN0IGludGVycnVwdCBmaWxlcyB0aGF0IGNhbiBiZSBh
bGxvY2F0ZWQgYnkgS1ZNLgo+Cj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5
dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyB8
IDEyICsrKysrKysrKysrLQo+ICBpbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaCAg
ICAgfCAgMyArKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jIGIvYXJjaC9yaXNj
di9rdm0vYWlhLmMKPiBpbmRleCBkYWQzMTgxODU2NjAwLi5jYWMzYzJiNTFkNzI0IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMK
PiBAQCAtNjMwLDcgKzYzMCw3IEBAIGludCBrdm1fcmlzY3ZfYWlhX2luaXQodm9pZCkKPiAgICAg
ICAgICAqLwo+ICAgICAgICAgaWYgKGdjKQo+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfYWlh
X25yX2hnZWkgPSBtaW4oKHVsb25nKWt2bV9yaXNjdl9haWFfbnJfaGdlaSwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChnYy0+Z3Vlc3RfaW5kZXhfYml0
cykgLSAxKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdj
LT5ucl9ndWVzdF9maWxlcyk7Cj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIGt2bV9y
aXNjdl9haWFfbnJfaGdlaSA9IDA7Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1pbXNpYy1zdGF0ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1z
dGF0ZS5jCj4gaW5kZXggZGM5NWFkODU2ZDgwYS4uY2NjY2EzODk4MzU3NyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiArKysgYi9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiBAQCAtNzk0LDcgKzc5NCw3IEBAIHN0
YXRpYyBpbnQgX19pbml0IGltc2ljX3BhcnNlX2Z3bm9kZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAq
Zndub2RlLAo+Cj4gIGludCBfX2luaXQgaW1zaWNfc2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9o
YW5kbGUgKmZ3bm9kZSwgdm9pZCAqb3BhcXVlKQo+ICB7Cj4gLSAgICAgICB1MzIgaSwgaiwgaW5k
ZXgsIG5yX3BhcmVudF9pcnFzLCBucl9tbWlvcywgbnJfaGFuZGxlcnMgPSAwOwo+ICsgICAgICAg
dTMyIGksIGosIGluZGV4LCBucl9wYXJlbnRfaXJxcywgbnJfbW1pb3MsIG5yX2d1ZXN0X2ZpbGVz
LCBucl9oYW5kbGVycyA9IDA7Cj4gICAgICAgICBzdHJ1Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyAq
Z2xvYmFsOwo+ICAgICAgICAgc3RydWN0IGltc2ljX2xvY2FsX2NvbmZpZyAqbG9jYWw7Cj4gICAg
ICAgICB2b2lkIF9faW9tZW0gKiptbWlvc192YSA9IE5VTEw7Cj4gQEAgLTg4OCw2ICs4ODgsNyBA
QCBpbnQgX19pbml0IGltc2ljX3NldHVwX3N0YXRlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25v
ZGUsIHZvaWQgKm9wYXF1ZSkKPiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogQ29uZmlndXJlIGhh
bmRsZXJzIGZvciB0YXJnZXQgQ1BVcyAqLwo+ICsgICAgICAgZ2xvYmFsLT5ucl9ndWVzdF9maWxl
cyA9IEJJVChnbG9iYWwtPmd1ZXN0X2luZGV4X2JpdHMpIC0gMTsKPiAgICAgICAgIGZvciAoaSA9
IDA7IGkgPCBucl9wYXJlbnRfaXJxczsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIHJjID0gaW1z
aWNfZ2V0X3BhcmVudF9oYXJ0aWQoZndub2RlLCBpLCAmaGFydGlkKTsKPiAgICAgICAgICAgICAg
ICAgaWYgKHJjKSB7Cj4gQEAgLTkyOCw2ICs5MjksMTUgQEAgaW50IF9faW5pdCBpbXNpY19zZXR1
cF9zdGF0ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gICAg
ICAgICAgICAgICAgIGxvY2FsLT5tc2lfcGEgPSBtbWlvc1tpbmRleF0uc3RhcnQgKyByZWxvZmY7
Cj4gICAgICAgICAgICAgICAgIGxvY2FsLT5tc2lfdmEgPSBtbWlvc192YVtpbmRleF0gKyByZWxv
ZmY7Cj4KPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogS1ZNIHVzZXMg
Z2xvYmFsLT5ucl9ndWVzdF9maWxlcyB0byBkZXRlcm1pbmUgdGhlIGF2YWlsYWJsZSBndWVzdAo+
ICsgICAgICAgICAgICAgICAgKiBpbnRlcnJ1cHQgZmlsZXMgb24gZWFjaCBDUFUuIFRha2UgdGhl
IG1pbmltdW0gbnVtYmVyIG9mIGd1ZXN0Cj4gKyAgICAgICAgICAgICAgICAqIGludGVycnVwdCBm
aWxlcyBhY3Jvc3MgYWxsIENQVXMgdG8gYXZvaWQgS1ZNIGluY29ycmVjdGx5IGFsbG9jYXRsaW5n
CgpzL2FsbG9jYXRsaW5nL2FsbG9jYXRpbmcvCgo+ICsgICAgICAgICAgICAgICAgKiBhbiB1bmV4
aXN0ZWQgb3IgdW5tYXBwZWQgZ3Vlc3QgaW50ZXJydXB0IGZpbGUgb24gc29tZSBDUFVzLgo+ICsg
ICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgbnJfZ3Vlc3RfZmlsZXMgPSAocmVz
b3VyY2Vfc2l6ZSgmbW1pb3NbaW5kZXhdKSAtIHJlbG9mZikgLyBJTVNJQ19NTUlPX1BBR0VfU1og
LSAxOwo+ICsgICAgICAgICAgICAgICBnbG9iYWwtPm5yX2d1ZXN0X2ZpbGVzID0gbWluKGdsb2Jh
bC0+bnJfZ3Vlc3RfZmlsZXMsIG5yX2d1ZXN0X2ZpbGVzKTsKPiArCj4gICAgICAgICAgICAgICAg
IG5yX2hhbmRsZXJzKys7Cj4gICAgICAgICB9Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmggYi9pbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1z
aWMuaAo+IGluZGV4IDc0OTQ5NTJjNTUxODcuLjQzYWVkNTIzODUwMDggMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4
L2lycWNoaXAvcmlzY3YtaW1zaWMuaAo+IEBAIC02OSw2ICs2OSw5IEBAIHN0cnVjdCBpbXNpY19n
bG9iYWxfY29uZmlnIHsKPiAgICAgICAgIC8qIE51bWJlciBvZiBndWVzdCBpbnRlcnJ1cHQgaWRl
bnRpdGllcyAqLwo+ICAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG5yX2d1ZXN0X2lkczsKPgo+ICsgICAgICAgLyogTnVtYmVyIG9mIGd1ZXN0IGludGVycnVw
dCBmaWxlcyBwZXIgY29yZSAqLwo+ICsgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG5yX2d1ZXN0X2ZpbGVzOwo+ICsKPiAgICAgICAgIC8qIFBlci1DUFUgSU1T
SUMgYWRkcmVzc2VzICovCj4gICAgICAgICBzdHJ1Y3QgaW1zaWNfbG9jYWxfY29uZmlnIF9fcGVy
Y3B1ICAgICAgKmxvY2FsOwo+ICB9Owo+IC0tCj4gMi4yMC4xCj4KCk90aGVyd2lzZSwgaXQgbG9v
a3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKQHRnbHgsIElzIGl0IG9rYXkgdG8gdGFrZSB0aGlzIHRocm91Z2ggdGhlIEtWTSBSSVND
LVYgdHJlZQpzaW5jZSB0aGlzIGNoYW5nZSBmb2N1c2VzIG9uIGd1ZXN0IGZpbGVzIHVzZWQgYnkg
S1ZNID8KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
