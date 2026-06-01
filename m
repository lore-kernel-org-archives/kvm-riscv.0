Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126A4CD6E4C
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBX7wyTu98Q/Q9hB5LWigJcVbkBbfIRHsz3Sh/9PnR4=; b=IXl/ww10Un5RXs
	CvOMFzlbU0DzzfRad/jZ1s6S9fadaDImv3onZ+yiEUSf+y3Sa99961hRYpusFR65rlRTF56mSvCzK
	xmCx25KqpxO4Ri7piNU0Gr+Vq2RQl4Mg2/MQqb0w+z9rD1MRtUAcXK1mMxEBdLmSVl0kzGTsTlMRk
	xIQ5kfN0NdNX5b9xiBJebpdZwW1Kshqwy6xxtTtWTz1WjdvU25T2jbLrwnnbLQYF5YYMot0LYDWeK
	QFptSzQu+uZEMRRtirULjSijPftTE74UMsBeaij6NCeVbJ59y/YKN6ow/zIv4P6lyn9x4Ahc0Ojjc
	oDKjIr9YkwQvmLQ3j5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3c-0000000ACQY-3Rj7;
	Mon, 01 Jun 2026 06:23:28 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3Y-0000000ACOH-3hm8
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 06:23:26 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-43cfc372abbso272286fac.3
        for <kvm-riscv@lists.infradead.org>; Sun, 31 May 2026 23:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780295004; cv=none;
        d=google.com; s=arc-20240605;
        b=IYiQOkojfcYpKdPht642XfLtwRdtLomp0f6jbupfpA1U0lvpQiG86kMt2IoYtI1FvR
         w0bGkNUIRwOX3pOpUnhTtz+mzNgV/uNe8vd05ywuNfbA2hTpDRJ7pxLx6DrLrjeo9+me
         91d8h995ui5RAsEKZn9YfwaVg808jswegrjDQj+g+I9l90LD2RrktL8JTfwYqhP47MPq
         nOlU2c+mvDwc9H50GuiUsDDckhuECRXTEJ25j9/38bigVW7pZoLhA5GgEfUIAUNN9Uem
         nc60BiwEUAFtaPyIJ9W+g7t53OneZ1DzkB0k1mfXovwu8vwBpdK4nPLG5FieDxgsou8B
         bwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Tz3p3k3U+Y3ZV6RLRiUy+C+O8VoH3a2d1/FWAmkUh0=;
        fh=ta6M4J6pOc/iRbzz7R0wqwZi/JkPY2X5pAEF2y96Cag=;
        b=F20+XrlKHONFJc7laRtReh9GrvQO2UZ0N9Wv0jBdRrZkpR+FJrJ9yDn4a4/QGIHk8R
         m1pSSQfCqvxklhngp6QPpRAhnfmvSiWluzwALmoJ3vjpPsnseIcLpaiye5DUtwDnTguO
         /iEvjJ5kkNOCXc3eYaSLR6C81qnVI34LLZc3im5x4ANorrBLh4fWT+ZYDc3CiCebVhZk
         tQMNvpOy1ny1Aw8iKN9RIbMbRpj6Pwc1Ls0YRpiqOKQCz7eIAQvj87QqH7ZPh8rTL3dz
         vcfUiYBxDndbilfuXpUFHck2zgK7PUF5+x5/S3uBWdpdbNUKngFZ2KtXHfYOHlF/kpHA
         0f5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780295004; x=1780899804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tz3p3k3U+Y3ZV6RLRiUy+C+O8VoH3a2d1/FWAmkUh0=;
        b=TbT/jLD0dv5JjmjkLgisN2xriJggJ2/DYTeQO0moknaBZApTj3e+8FS3An8okAgmK+
         g1AiniM3cvZouUghcL0QB6H9TOyN+j5/tOXSKaVKsm68IgxcdOp2nYtQx92692y/C7H9
         OU7lkYaP5zY/oudjhLVxhfBF/CwpJV0/ZG/YQwo61DavPwyRz1bIkBdQAUwWDik3CyFE
         F427XmTKEffj1+1qi7+I8lsfdUHCfB7W2tQH9m03OuuobAqvfKL9usmlfNN9uA0r7mEJ
         kZ7vMT13WRBjm/QQPO06CKyQzuc8WlA9k7Lk30Xshzgix8SN9V76q3fUJQIT1Dxb7HqY
         ujIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295004; x=1780899804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tz3p3k3U+Y3ZV6RLRiUy+C+O8VoH3a2d1/FWAmkUh0=;
        b=rtK6n+dMmW/zYRsJd/nVSvWgzW84H5tF6cM57/Ktn9IsMWdg2Du0RhlEFG0OekNm03
         CdzMoiJFDCRRipncGme542+cGqEtrcNQ9FF0CX4MzNBjk4Oijs9djYpM5YZN9DMyzLo9
         Ci4Je2RNW5hDdtrSWSIHj+XYUr5bX6qUWeqHKLApj1WFVLwi1cwZTtvglae1X6tPOxvg
         A6zqBb62VIX5ileNa+/yOFVPprTnX6SuXLKAqGe2hQhkFQuhpV/RwCXujowq10x3zGAR
         AmtWgP4ztUrEtlq65O8hkIOyfvdr2AXDnq4UV8Y4JKod9MWFz8Ha64QQXwD5r01gdVbq
         yOMg==
X-Forwarded-Encrypted: i=1; AFNElJ9A5M715SsGKwsGfrkaLpVJDNjiGkFIqvgGwj8m1x6s+V9y/ZpnXCf+U6bvym3852Lxak0M5LEUEcA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwO7MmeU9J8WSgRQn9ofg2xQbOBA4qsJsjEHFWUuV6T6bl4sN/l
	A+/Ek/AdQ/SsPowAsL78oPNpbl0amz0sz+EtLr5/Rf3CfY+FnkNknCp2wHVOpO2iOxg4YOb1a6K
	Im1myYYwCLvtuFhcVxhKryylXCFe5KPy+MRn+SBFD0w==
X-Gm-Gg: Acq92OHh2jyMKXYq0hzta9vc59qrWDPWbItobun4u0kyDbOEUYawnC60IenRIgXkvBb
	PG+SfiEvymefPm9RJw/k3EG/DjdMwQQZ4Kt0AgbSM75qBbQUhA7TRrZJOKOaNbLOVb/0i4ZP9bU
	c6R5YzjzcYdW7HNrgocscQgLwQbt0i8odpep8sMt+5nzqciRlizz9aiMwXFNa8HghRhvakbBZX0
	udQpwSBV9NVM2CShI1Vb+xq8THAAm69ZFfarqKn/EUhtLNZXU00dUwdMpvAMSfvdxCTzeiRv9Oi
	lg6HtcPQvPcfBTkwVPFX1qND1wKKWn332Jj902V/gZKL5NYJirAPOlJanAwZdu8j6UGerz0eAp9
	2b8XSsnkZgHhn13hwiKA0jnM5Wbi7bVzGo0Dttw==
X-Received: by 2002:a05:6820:2d4a:b0:69e:2c0:8485 with SMTP id
 006d021491bc7-69e105a8b63mr5036974eaf.45.1780295003702; Sun, 31 May 2026
 23:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn> <20260429173534386Dfz8RALJT73-jMfif0nSb@zte.com.cn>
In-Reply-To: <20260429173534386Dfz8RALJT73-jMfif0nSb@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 11:53:10 +0530
X-Gm-Features: AVHnY4KcrK1-f9Gli02tgY1vU1JpDz19ta3d5NZ0oRcBHrYoMGeM9BX0ga_fxIc
Message-ID: <CAAhSdy2qqpZ6qucwsuRZWnKgno03Ok4czv8RTgpjA73i+yFhng@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=C2=A0=5BPATCH_v2_2=2F3=5D_RISC=2DV=3A_KVM=3A_add_tracepoints_fo?=
	=?UTF-8?Q?r_guest_page_faults?=
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_232324_923831_566CE077 
X-CRM114-Status: GOOD (  16.28  )
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

T24gV2VkLCBBcHIgMjksIDIwMjYgYXQgMzowNeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4KPiBBZGQgdGhlIGt2bV9wYWdlX2ZhdWx0IGV2ZW50IHRyYWNlcG9pbnRzIHRvIGNv
dW50IHRoZSBudW1iZXIgb2YgS1ZNCj4KPiBndWVzdCBwYWdlIGZhdWx0cy4KPgo+Cj4gU2lnbmVk
LW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+CgpMb3Qgb2Yg
cmVkdW5kYW50IG5ld2xpbmVzIGluIHRoaXMgcGF0Y2guIExvb2tzIGxpa2UgdGhpcyBwYXRjaAp3
YXMgbm90IHNlbnQgdXNpbmcgImdpdCBzZW5kLWVtYWlsIi4KClJlZ2FyZHMsCkFudXAKCgo+Cj4g
LS0tCj4KPiAgYXJjaC9yaXNjdi9rdm0vdHJhY2UuaCAgICAgfCAyNSArKysrKysrKysrKysrKysr
KysrKysrKysrCj4KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgfCAgMyArKysKPgo+ICAy
IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKPgo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3RyYWNlLmggYi9hcmNoL3Jpc2N2L2t2bS90cmFjZS5oCj4KPiBpbmRleCAzZDU0
MTc1ZDgwNWMuLjkwNTZjYzk4ODNjZiAxMDA2NDQKPgo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Ry
YWNlLmgKPgo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3RyYWNlLmgKPgo+IEBAIC01Niw2ICs1Niwz
MSBAQCBUUkFDRV9FVkVOVChrdm1fZXhpdCwKPgo+ICAgX19lbnRyeS0+aHRpbnN0KQo+Cj4gICk7
Cj4KPgo+Cj4gKy8qCj4KPiArICogVHJhY2Vwb2ludCBmb3IgcGFnZSBmYXVsdC4KPgo+ICsgKi8K
Pgo+ICtUUkFDRV9FVkVOVChrdm1fcGFnZV9mYXVsdCwKPgo+ICsgVFBfUFJPVE8oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1NjQgZmF1bHRfYWRkcmVzcywgdTY0IGVycm9yX2NvZGUpLAo+Cj4gKyBU
UF9BUkdTKHZjcHUsIGZhdWx0X2FkZHJlc3MsIGVycm9yX2NvZGUpLAo+Cj4gKwo+Cj4gKyBUUF9T
VFJVQ1RfX2VudHJ5KAo+Cj4gKyBfX2ZpZWxkKHVuc2lnbmVkIGludCwgICB2Y3B1X2lkKQo+Cj4g
KyBfX2ZpZWxkKHU2NCwgICAgICAgICAgICBmYXVsdF9hZGRyZXNzKQo+Cj4gKyBfX2ZpZWxkKHU2
NCwgICAgICAgICAgICBlcnJvcl9jb2RlKQo+Cj4gKyApLAo+Cj4gKwo+Cj4gKyBUUF9mYXN0X2Fz
c2lnbigKPgo+ICsgX19lbnRyeS0+dmNwdV9pZCAgICAgICAgPSB2Y3B1LT52Y3B1X2lkOwo+Cj4g
KyBfX2VudHJ5LT5mYXVsdF9hZGRyZXNzICA9IGZhdWx0X2FkZHJlc3M7Cj4KPiArIF9fZW50cnkt
PmVycm9yX2NvZGUgICAgID0gZXJyb3JfY29kZTsKPgo+ICsgKSwKPgo+ICsKPgo+ICsgVFBfcHJp
bnRrKCJ2Y3B1ICV1IGFkZHJlc3MgMHglMDE2bGx4IGVycm9yX2NvZGUgMHglbGx4IiwKPgo+ICsg
X19lbnRyeS0+dmNwdV9pZCwKPgo+ICsgX19lbnRyeS0+ZmF1bHRfYWRkcmVzcywKPgo+ICsgX19l
bnRyeS0+ZXJyb3JfY29kZSkKPgo+ICspOwo+Cj4gKwo+Cj4gICNlbmRpZiAvKiBfVFJBQ0VfUlNJ
Q1ZfS1ZNX0ggKi8KPgo+Cj4KPiAgI3VuZGVmIFRSQUNFX0lOQ0xVREVfUEFUSAo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9l
eGl0LmMKPgo+IGluZGV4IDBiYjBjNTFlM2M4OS4uMGNmYjAxNDlkYTlmIDEwMDY0NAo+Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPgo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfZXhpdC5jCj4KPiBAQCAtMTEsNiArMTEsNyBAQAo+Cj4gICNpbmNsdWRlIDxhc20vaW5zbi1k
ZWYuaD4KPgo+ICAjaW5jbHVkZSA8YXNtL2t2bV9tbXUuaD4KPgo+ICAjaW5jbHVkZSA8YXNtL2t2
bV9uYWNsLmg+Cj4KPiArI2luY2x1ZGUgInRyYWNlLmgiCj4KPgo+Cj4gIHN0YXRpYyBpbnQgZ3N0
YWdlX3BhZ2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVu
LAo+Cj4gICAgICAgIHN0cnVjdCBrdm1fY3B1X3RyYXAgKnRyYXApCj4KPiBAQCAtNDMsNiArNDQs
OCBAQCBzdGF0aWMgaW50IGdzdGFnZV9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwg
c3RydWN0IGt2bV9ydW4gKnJ1biwKPgo+ICAgfTsKPgo+ICAgfQo+Cj4KPgo+ICsgdHJhY2Vfa3Zt
X3BhZ2VfZmF1bHQodmNwdSwgZmF1bHRfYWRkciwgdHJhcC0+c2NhdXNlKTsKPgo+ICsKPgo+ICAg
cmV0ID0ga3ZtX3Jpc2N2X21tdV9tYXAodmNwdSwgbWVtc2xvdCwgZmF1bHRfYWRkciwgaHZhLAo+
Cj4gICAodHJhcC0+c2NhdXNlID09IEVYQ19TVE9SRV9HVUVTVF9QQUdFX0ZBVUxUKSA/IHRydWUg
OiBmYWxzZSwKPgo+ICAgJmhvc3RfbWFwKTsKPgo+IC0tCj4KPiAyLjQzLjUKPgo+Cj4KPgo+Cj4K
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
