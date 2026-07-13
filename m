Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836AAC44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 12:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9NYoFF5seu6xNyAOfTOsfxCs6zMIeuiwU2u3hkftjI=; b=FmodyRHzlJRKtT
	IsjIUpgPXVWK6ymmoIgAuxQaFCAmCv49go1H73tmo03ygSEu1vTVm7aCZei/X/LsKcj0TxKFT8+tX
	pjGvCszUv6mE/R/BzEKyy32N3lIrhVeQHqpgyrLxHngaJKrBy5sAcG/qYpIyCK/o6TAEalaT24bKD
	GqyMpqpY88D22u7Ghez8zKySrE3FSXiHZv0l/DTJKtxR13dEmsCavJXAneOhhEu6Vh9pa9SxMjwCJ
	zQ2pMu6FMws74mpwlhcF/0BSqC86fsIxm7QgjTEUcMqax6hJBJviryAVm/GV3OEGRhsIW47Oe6zf/
	Eo55uFvvn+44knDATHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFNm-000000096tU-3Raw;
	Mon, 13 Jul 2026 12:03:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFNj-000000096sC-28DK
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 12:03:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2996686f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 13 Jul 2026 05:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783944209; cv=none;
        d=google.com; s=arc-20260327;
        b=N81cMEpEZFmq+oGl/1UadOpdU2fWXSSmPKP9SN4hN5BBoyCurzS5QnaTgzR9lff1EN
         8jeiZGAGunbTIVMdDtEi0SqQTaFaWaUrT76jSaSRbcS2bVNS+lFOsQU6qiWhU9Iqz0vQ
         s2lTyE2aWjVl6ufHLn3+4sx2VqCcgjAcQFSS6t6yMPHE4fS87ClBreoFa4doHtWEcFjS
         7oO9WRPdbkts9cjOcxhnGp0eYEw119ccEJ5SAXbd4xh2Jm6sWutba4YbM0gXBDiEK22p
         c80cBjB+v3g96NonNbEe5Yj69WxNkja/s/RGnvMUdkpCLP1Qii7iI1GoBiw5rcM71v21
         lJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oozs3eFC1FFs/wCU61IvN3QW98PJylYyvcgjFAJyGPk=;
        fh=+CjChMdid4L027HwynTc9R8qF7Zb03chjKEpRhBmRW0=;
        b=RV5DOaSJQFRyqxN7ONRzMd2dqO4yEKNA15uVKFbOz9CXrwloHvsYuxHZc5gMQjZmzW
         uyU9XmVvb0jSvf2BMOtIeEajCqC43MOQtvZsBnK9d+oAwV10KbubcKe7hTQqpjncE5hj
         kzVe1fbagR1WAAY64VgeNnDY5jQuYRuWdota6B6ypJhpN83E4qcDrSD12otcT3M1RWc2
         kCGKtvE5y/v83fSpyxKztN9wc1qIkwsvaZI3lkbpav58kWoLCuN5HCkEUOwGiZq87Y5F
         fY/+GZhcACqoMyHIpXiSXyFTWkHieoXM+S2Y9a0t/ojQTxLLIxonoymQ56/PS3LXFh/k
         v2Fw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783944209; x=1784549009; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oozs3eFC1FFs/wCU61IvN3QW98PJylYyvcgjFAJyGPk=;
        b=yuLVZ9l9g9IkC0kkWoFyQaVKQWqP2RofP8FcvCp2Heo/JpYkpk1ydFoMnoJG1A/F+g
         wzMFWKz3au+IHxsEKu6ckhrmduNMgE+yyA0rMBfXZ04dHQwzBqqvcWWOvd1RRBGIw8rj
         j7p6RAxSfaRoqzLiii8JGByDQ+HWw7LOZ2CftgjuWymCOHTdYtQoZUsFx/17UtNVKeQL
         /9iAfOPFHQBXR9vNffsQCqYUJFrFWboxLxzyY+4S9PdpwGCJxeQcv6cEBvMKgdAcRD+O
         SfPdky6XFgCjSIoHnc7jCXufKx9YRjKML12A4WYJh7DX06Y3v8o31Y6ahSbE3/lebo0p
         +EYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944209; x=1784549009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oozs3eFC1FFs/wCU61IvN3QW98PJylYyvcgjFAJyGPk=;
        b=BzabRbyWZBDV3WYzhlvpOf/0u5OAyZYM1d76rRoXxhFO19KpI8Qtw7zWzVK0HIEcE1
         /KpLVEjGd4gmxfiM4sPCpMJEiSO4fsoJB7Xl+wl3Ic7qDLQ15xEPiH7KmnP0h9pQEOsH
         8adHT6zBRRwd+Xl4xvXP3XBjdRUBGzhCP+r9oenaN41bFEGHtdeiNBiQEf5ID2LSYAFe
         WHGVTxrpcEP4WLGe6UucmbPoQgR2Q4xjlkHqIbkvs7vOKJjWkJaTxdrngNybvd1a3erM
         CjCQMetSnJtMwfTPIJHpJW3e/Obovj6QfvJczxvBY1XOZBo6zJEiAI6nIvqL/TFXz+4+
         3wRA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3a+h44Hqag4dYDCjoi+J7t3l0MWm/lIy5vXBmuaBlBJfMQ40RwoAES+2HvjdQWI10I6Jqg4rB3WM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/M5HS4Gp3L8lw5100BbLDQhV0l6QB0ZfAEZUp+KA8LCX+uWet
	addVOygLA886ShiAlmMT1h96fwvseRNNC1swgc/oanWwBoTHRVNu9jCfE6OYjaCijlA+zNC0aI1
	WfODgvhkdkOBJYD1m0MTUFPbZIezaUWHtozeF3dGX8Q==
X-Gm-Gg: AfdE7ckugDg0Wc5UqeBxTowgbBPBD5UTscnJGMQVw99JPSEoSLHWm+i9q9rYq9cFzpy
	K/fr+pWIeFrC+AnNM6rAY9YwJf5r0vXcIGhpxE325YDylM7LZ5ccl8mM7LkBCZTUuhIdc5aj4gC
	QkV+ULjZy1m1osnzcjv5b2vzAzHeICxOylo9MYVrjaRF2d5cumatbWdqz3vV3ivsFuflcxs3krJ
	jjyZcn2wlC02vm7r0zQpLhXTpJXlZvyoEOv34vP7X0dAfR0Bwy9iO9EevxUO/zSGcfc4XQInDB+
	oXNeMsTvJtjxxw+5oTDEblMHmmE7eMsgBgjfteKgtnFIgowjQnKryAhGd/etq4Fid4RzZNdh1U2
	R7h6j1FtLhpGeRfCTNHlboLlK3Q==
X-Received: by 2002:a05:600c:468f:b0:493:df1d:7488 with SMTP id
 5b1f17b1804b1-493f87e5b4cmr96665755e9.16.1783944209169; Mon, 13 Jul 2026
 05:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260626054051.3360865-1-shengwen1997.tw@gmail.com>
In-Reply-To: <20260626054051.3360865-1-shengwen1997.tw@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Jul 2026 17:33:16 +0530
X-Gm-Features: AUfX_myWpn2AvfXbvMGkjx49S1JKE-8WzmOZBUvjQKodn67rqUdZl1K_Gwiur7Q
Message-ID: <CAAhSdy253v97ivo8rx9ftnAdYaQs6zmjaJ+yRnk6x-Kt7Xm_XQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: PMU: Bound counter mask scan to BITS_PER_LONG
To: Shengwen Cheng <shengwen1997.tw@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050331_829809_9EAFE568 
X-CRM114-Status: GOOD (  19.03  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMTE6MTHigK9BTSBTaGVuZ3dlbiBDaGVuZwo8c2hlbmd3
ZW4xOTk3LnR3QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgUE1VIFNCSSBoYW5kbGVyIHBhc3Nl
cyB0aGUgZ3Vlc3QgYXJndW1lbnQgcmVnaXN0ZXJzIGRpcmVjdGx5IHRvIHRoZQo+IFBNVSBzdGFy
dC9zdG9wIGhlbHBlcnM6Cj4KPiBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX3N0YXJ0KHZjcHUsIGNw
LT5hMCwgY3AtPmExLCBjcC0+YTIsIC4uLikKPiBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX3N0b3Ao
dmNwdSwgY3AtPmEwLCBjcC0+YTEsIGNwLT5hMiwgLi4uKQo+Cj4gd2hpY2ggbWFwIHRvOgo+Cj4g
dW5zaWduZWQgbG9uZyBjdHJfYmFzZQo+IHVuc2lnbmVkIGxvbmcgY3RyX21hc2sKPiB1bnNpZ25l
ZCBsb25nIGZsYWdzCj4KPiBUaHVzIGNwLT5hMSBpcyBhIHNpbmdsZSB1bnNpZ25lZCBsb25nIGN0
cl9tYXNrLCBub3QgYSBiaXRtYXAgYXJyYXkgc2l6ZWQKPiBmb3IgUklTQ1ZfTUFYX0NPVU5URVJT
Lgo+Cj4gT24gUlYzMiwgUklTQ1ZfTUFYX0NPVU5URVJTIGlzIDY0IHdoaWxlIEJJVFNfUEVSX0xP
TkcgaXMgMzIuICBVc2luZwo+IGZvcl9lYWNoX3NldF9iaXQoKSB3aXRoIFJJU0NWX01BWF9DT1VO
VEVSUyBjYW4gdGhlcmVmb3JlIG1ha2UKPiBmaW5kX25leHRfYml0KCkgYWNjZXNzIGJpdHMgYmV5
b25kIHRoZSBzdG9yYWdlIG9mIGN0cl9tYXNrIG9uIFJWMzIuCj4KPiBMaW1pdCB0aGUgc2NhbiB0
byBCSVRTX1BFUl9MT05HLiAgVGhlIHJlcXVlc3RlZCBjb3VudGVyIHJhbmdlIGlzIGFscmVhZHkK
PiB2YWxpZGF0ZWQgYnkga3ZtX3BtdV92YWxpZGF0ZV9jb3VudGVyX21hc2soKSwgc28gdGhpcyBw
cmVzZXJ2ZXMgUlY2NAo+IGJlaGF2aW9yIGFuZCBhdm9pZHMgYW4gb3V0LW9mLWJvdW5kcyBiaXRt
YXAgcmVhZCBvbiBSVjMyLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2hlbmd3ZW4gQ2hlbmcgPHNoZW5n
d2VuMTk5Ny50d0BnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBhIGZpeCBmb3IgTGludXgt
Ny4yLXJjWAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5j
IHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfcG11LmMKPiBpbmRleCBiYjQ2ZGNiZmIuLjIwMjViNjY0OSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dV9wbXUuYwo+IEBAIC01ODYsNyArNTg2LDcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9jdHJf
c3RhcnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYXNlLAo+ICAg
ICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gICAgICAgICAvKiBTdGFydCB0aGUgY291bnRl
cnMgdGhhdCBoYXZlIGJlZW4gY29uZmlndXJlZCBhbmQgcmVxdWVzdGVkIGJ5IHRoZSBndWVzdCAq
Lwo+IC0gICAgICAgZm9yX2VhY2hfc2V0X2JpdChpLCAmY3RyX21hc2ssIFJJU0NWX01BWF9DT1VO
VEVSUykgewo+ICsgICAgICAgZm9yX2VhY2hfc2V0X2JpdChpLCAmY3RyX21hc2ssIEJJVFNfUEVS
X0xPTkcpIHsKPiAgICAgICAgICAgICAgICAgcG1jX2luZGV4ID0gYXJyYXlfaW5kZXhfbm9zcGVj
KGkgKyBjdHJfYmFzZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFJJU0NWX0tWTV9NQVhfQ09VTlRFUlMpOwo+ICAgICAgICAgICAgICAgICBpZiAoIXRl
c3RfYml0KHBtY19pbmRleCwga3ZwbXUtPnBtY19pbl91c2UpKQo+IEBAIC02NTgsNyArNjU4LDcg
QEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9jdHJfc3RvcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHVuc2lnbmVkIGxvbmcgY3RyX2Jhc2UsCj4gICAgICAgICB9Cj4KPiAgICAgICAgIC8qIFN0b3Ag
dGhlIGNvdW50ZXJzIHRoYXQgaGF2ZSBiZWVuIGNvbmZpZ3VyZWQgYW5kIHJlcXVlc3RlZCBieSB0
aGUgZ3Vlc3QgKi8KPiAtICAgICAgIGZvcl9lYWNoX3NldF9iaXQoaSwgJmN0cl9tYXNrLCBSSVND
Vl9NQVhfQ09VTlRFUlMpIHsKPiArICAgICAgIGZvcl9lYWNoX3NldF9iaXQoaSwgJmN0cl9tYXNr
LCBCSVRTX1BFUl9MT05HKSB7Cj4gICAgICAgICAgICAgICAgIHBtY19pbmRleCA9IGFycmF5X2lu
ZGV4X25vc3BlYyhpICsgY3RyX2Jhc2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBSSVNDVl9LVk1fTUFYX0NPVU5URVJTKTsKPiAgICAgICAgICAgICAg
ICAgaWYgKCF0ZXN0X2JpdChwbWNfaW5kZXgsIGt2cG11LT5wbWNfaW5fdXNlKSkKPiAtLQo+IDIu
NDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
