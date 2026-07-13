Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EA9C43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aDBq4G2ZG1pG6Q2OccpfzJj4MQ55pSQ3OuBq7gtRO0=; b=pgfG6s0/FXX5Dk
	qXSXK1cH97yr8GbUqVCzieQkul79bAHaeNckzSXZC3zQSMf10JJKT1sAe6k3wr0J2HG8RXh+nypmB
	3YLPei3MpFg1XGJTuqEqbcSj2XwWRSgd9YFtPOzPbX7WezL/fj+eLfs2nvChqxCJZXwjFNeR5xfux
	UVboFHH/bTF/Y90acnGaiPihah8NPdZ0tMDfsq4QafoFXowyzG6iGuA74HgmPSj0tkfUBlzmU2D5+
	+LiIjD1mMYASEozz5+9R4wCEaskZUkj+3423eYHxNOyowNuNaXCd1sfrM36VwLusGtmvePvqiwaDy
	TjAXRBB4XHPvMg8+XQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFwp-00000009DWH-0TJd;
	Mon, 13 Jul 2026 12:39:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFwm-00000009DVN-2FKV
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 12:39:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-470174001a0so1854538f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 13 Jul 2026 05:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783946383; cv=none;
        d=google.com; s=arc-20260327;
        b=jtpOGIcQ1KZAubK7kjyGdS111G0qgVAdz+zearvjqWlbHGzfamLby02vW/LLA8ZRl9
         3QrIB9BsnaFXeLJT7LFoMsgdTzya/EHmeapuLoNK5FAu561IvXhmvnC3Nh6NqXR4Yxmq
         cEeK/dQQ0ongmxJ4Gjt2NRc9oZcPG/IgqQixpnMMCYQhcmq/j1JXcN3tsHo76bRQBVTY
         8PUIrfdPt8fe0NNUxKUPyTdfoz5hyujEFTg9w6YB0MMytytETdU7jaJT40944Q4Sjx1r
         yHatMUWxA7ECGfDjJaJY3KVnwJD9AtL6LiyELUlfXjS89JPfeHJgOIH+vbjePiOxFwkR
         9+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NNWZP8g0uAP0JL7jY1bzT8JQmyJ8lb4pF2POpRvfaPE=;
        fh=kq2J9rHysOQA5cQ0xM7Sumv+N1WdDOOu3LzNEe/5R08=;
        b=h/pfbrMKNiq1DnrlvZpG8YWROZyMM0b+nt6k3xnfyyaKkMV/V0ajO7D2lrZjQO3uSJ
         bEd+rWDvecUJj9Ot6yueLeSn9//InPbfT/XQJQAm4STZp4SNoqDiTnjSfRtcO5qWd5fl
         Z+y2FpL4lqwrqZn4iG4QiS4Ba+zXFCO3u9CbXHCraoHiOrurwVsRzhfwQwRrQI7p0Ewc
         LWRNwPJ7LcQiGeovEcrIctRxd/Qp4jYS9hbzTWuzFWhqtpJfghaoCRc66+nomXp46McI
         C52HiGTtWSNZxfD8JWVurexZ8NEeOer6nXkKoURWhetiAoy44KSKNPdrmJ3s5dXnejUk
         U2Nw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783946383; x=1784551183; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NNWZP8g0uAP0JL7jY1bzT8JQmyJ8lb4pF2POpRvfaPE=;
        b=xu3QNpgEvGrUdBfNXVSR2igFyAGM3KJX+O8us6HdE9F+P9cM9M5wJF3ugoILqUn2X6
         3T4Y4sBamGUAW/CBl91Mu/9uCPPniDpX2+6//7o10+CAPprpJTp1WYCCq4jOu19cptrx
         +tgVj5kbEx2VZyp8XDPSCARsnoFjoV1LmyT8JRfUxuEX33/NM9RgwM5ymHiJntelphcs
         OXoHqf2t1gqvVR7/sH6HOzJV34JpWP0D7lc755oyYDarOkrmCedqTnluYW3EtbT39Axw
         nIvcFm5Q/x+/sQp86xA0F/VWQ7sZKN3AzBEjMXdxjATqOc5noxoYUa0UO7CC06AbBPI3
         RWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946383; x=1784551183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNWZP8g0uAP0JL7jY1bzT8JQmyJ8lb4pF2POpRvfaPE=;
        b=TY3py8T2Mt3gtsUQxuXB5shPhxrrOBm4vOT52cdjtbyR81HOlezvutcGbGbL/C6Bq6
         l8G4KHfyWHAYGCEwKGzwrqDCSGOce/WfvOAOEhRB2d99J9que/okBSIZUMrS/BYWpSi5
         j9x996fG1CD/Mu96Ia/vDz1yIEqD/DCE5d9BWWCVJ6ufuo57n2FLa2T/BoPHQ1PVVO5s
         duk3YcrEk2OuvOo+SDLtpR3DFWsHn2pRxe1g9o9chUXi7WhGEPHM+tUSKuHyDvRTo7Xg
         1uQVyFss7WrvaHTtdDXTkAdlzILmqYXVywZyYHqPdc2oiBEDXLmH6skdpxEmCCPHmtix
         KEmA==
X-Forwarded-Encrypted: i=1; AHgh+RokMNVFU4u94pYhn7UugKKX+HiWMz26N4aPf8fiqmnHhSQt6CCq4usS6LNy2vy1LzTDGx3IeCuoUjg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXUhhrxMGcD9w1e8Ndin+4KFHsNZlbEK6ArARvb0rltXYlqO6e
	nPJ35cKJBHZafIbkbVWnKzIgAewYyniI3EV3k3lKDeiWljPmvqE4mp16LSzfDIqs1NY+tttk2qT
	qTGwlMLcgL8z1JKAlP/TephQK/ZOvTn4kxF+1PNomQs8VwFit1/on
X-Gm-Gg: AfdE7clTMfH3yt6NEhmyEWgfqEyevr6pap6Gl1nN/eeGTwM/voPrsdsVJcascHKVi1J
	i+xMFubOUWke2+s55Ldqg9EqGMX0ngpEpRwjFKT/3Cvv4nwu2BhR+sobukvzmpbV7/wVWcINabI
	wWzZgHXLVlEDRGT1Ad48X08UdPp1LgLct1AJEcALXV/dMbjWfvLc5ViyHAwchkNRn7wbSVgvpG1
	U7/Kkana0+z1LEAinVRsrPWbLOEGdTXb7bYGEetUknOT/AqHPJFzPZiwVoh2H6vKu09CnhopRle
	VKoWsfd4Sm+k91E7tVzwYEWenS75eglNTAztqIutt6L1Mv8+rdjKRva7lBBa7fLSPXBzGRsR0Ik
	f013pMs7qsQX6/q1Yb7a7tNTsbA==
X-Received: by 2002:adf:e185:0:b0:477:71ef:5d81 with SMTP id
 ffacd0b85a97d-47f2dc8cd0bmr11146687f8f.6.1783946382636; Mon, 13 Jul 2026
 05:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260701075239.95542-1-fredwudi0305@gmail.com>
In-Reply-To: <20260701075239.95542-1-fredwudi0305@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 18:09:30 +0530
X-Gm-Features: AUfX_mwXj_7QcwyUg7nnOIiO2RcCPbUhH-15KvTXyB0HOEvvnkqibyEafWCL2JM
Message-ID: <CAAhSdy1YZYA6etr+Z552QNSGKM-iMpU7uGwDcYGydpb0b4qULg@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: Skip preventive hfence.gvma for new G-stage
 mappings with Svvptc
To: "Dylan.Wu" <fredwudi0305@gmail.com>
Cc: palmer@dabbelt.com, atish.patra@linux.dev, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, zhouquan@iscas.ac.cn, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_053944_592372_F76CA7BA 
X-CRM114-Status: GOOD (  18.20  )
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

T24gV2VkLCBKdWwgMSwgMjAyNiBhdCAxOjIz4oCvUE0gRHlsYW4uV3UgPGZyZWR3dWRpMDMwNUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gRm9yIEludmFsaWQtPlZhbGlkIEctc3RhZ2UgbGVhZiBQVEUg
dXBkYXRlcywgdGhlIGZsdXNoIGluCj4ga3ZtX3Jpc2N2X2dzdGFnZV9zZXRfcHRlKCkgaXMgcHJl
dmVudGl2ZS4gV2hlbiBTdnZwdGMgaXMgYXZhaWxhYmxlLCBuZXcKPiB2YWxpZCBQVEVzIGJlY29t
ZSB2aXNpYmxlIHRvIHRoZSBwYWdlLXRhYmxlIHdhbGtlciB3aXRoaW4gYSBib3VuZGVkCj4gdGlt
ZSwgc28gYW4gaW1tZWRpYXRlIGhmZW5jZS5ndm1hIGlzIHVubmVjZXNzYXJ5Lgo+Cj4gU2tpcCBn
c3RhZ2VfdGxiX2ZsdXNoKCkgZm9yIHRoYXQgY2FzZS4gUGVybWlzc2lvbi1yZXN0cmljdGluZyB1
cGRhdGVzCj4gY29udGludWUgdG8gdXNlIHRoZSBleGlzdGluZyBmbHVzaCBwYXRoLgo+Cj4gQXNz
aXN0ZWQtYnk6IFl1YW5TaGVuZzogZGVlcHNlZWstdjQtcHJvCj4gQ28tZGV2ZWxvcGVkLWJ5OiBR
dWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhv
dSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogRHlsYW4uV3UgPGZyZWR3
dWRpMDMwNUBnbWFpbC5jb20+CgpUaGUgcGF0Y2ggc3ViamVjdCBpcyB1bm5lY2Vzc2FyaWx5IGxv
bmcgYW5kIG5lZWRzIHNvbWUgc2ltcGxpZmljYXRpb24uCkFsc28sIHRoZXJlIGlzIG1pbm9yIHdh
cm5pbmcgcmVwb3J0ZWQgYnkgY2hlY2twYXRjaC5wbCByZWxhdGVkIHRvCmluY2x1ZGUgb2YgYXNt
L2NwdWZlYXR1cmUuaC4gSSB3aWxsIHRha2UgY2FyZSBvZiBib3RoIG9mIHRoZXNlIGF0IHRoZQp0
aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExpbnV4LTcu
Mi1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgfCA3
ICsrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jIGIvYXJjaC9yaXNjdi9r
dm0vZ3N0YWdlLmMKPiBpbmRleCBjNGMzYjc5NTYuLjdiODA1MTEyZCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4g
QEAgLTEwLDYgKzEwLDggQEAKPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGd0YWJsZS5oPgo+ICAjaW5jbHVkZSA8YXNtL2t2bV9nc3RhZ2UuaD4KPiArI2lu
Y2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gKyNpbmNsdWRlIDxhc20vaHdjYXAuaD4KPgo+ICAj
aWZkZWYgQ09ORklHXzY0QklUCj4gIHVuc2lnbmVkIGxvbmcga3ZtX3Jpc2N2X2dzdGFnZV9tYXhf
cGdkX2xldmVscyBfX3JvX2FmdGVyX2luaXQgPSAzOwo+IEBAIC0xNzEsOCArMTczLDExIEBAIGlu
dCBrdm1fcmlzY3ZfZ3N0YWdlX3NldF9wdGUoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwKPiAg
ICAgICAgIH0KPgo+ICAgICAgICAgaWYgKHB0ZV92YWwoKnB0ZXApICE9IHB0ZV92YWwobWFwLT5w
dGUpKSB7Cj4gKyAgICAgICAgICAgICAgIGJvb2wgd2FzX2ludmFsaWQgPSAhcHRlX3ZhbCgqcHRl
cCk7Cj4gICAgICAgICAgICAgICAgIHNldF9wdGUocHRlcCwgbWFwLT5wdGUpOwo+IC0gICAgICAg
ICAgICAgICBpZiAoZ3N0YWdlX3B0ZV9sZWFmKHB0ZXApKQo+ICsgICAgICAgICAgICAgICBpZiAo
Z3N0YWdlX3B0ZV9sZWFmKHB0ZXApICYmCj4gKyAgICAgICAgICAgICAgICAgICAhKHdhc19pbnZh
bGlkICYmCj4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtl
bHkoUklTQ1ZfSVNBX0VYVF9TVlZQVEMpKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBnc3Rh
Z2VfdGxiX2ZsdXNoKGdzdGFnZSwgY3VycmVudF9sZXZlbCwgbWFwLT5hZGRyKTsKPiAgICAgICAg
IH0KPgo+IC0tCj4gMi4zNC4xCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
