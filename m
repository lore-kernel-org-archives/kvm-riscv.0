Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA587F3D60F
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09decUfC7yXpOAR3R/U1AEtnw+CM6JOvRwCusYIIFgQ=; b=YQGcIjMQn+1nl9
	F3p3UJVzrotOkrUxlSRG4ND0vDM6lZEw6B8Z6GuE0oNBsMf2Xwnal/4G74jdcj0KfCszGsK/kxg8X
	Paioa39o/VDlYXvi+JRP3XV/S8vEWF6GQV2ycbK926QvX8G0RJHgQgXig9uR6qZ2iWebRM6HYVpmd
	MsOjqlg+4LcugDeWMMh3o85CBLBXTJk4d4HGqK5/anTYswEsydJ3CGuYXeZDSNkrcBGl2zYD0Qv4q
	oW2jbMbp1ju90zTkQowEBgoItKKpCKMz9xqoBvcMkiPG7KyzvFy4A0nAAXnKycobEHbuFsXoORojr
	oXM0+2P8RXLBzWxJY/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xT-0000000Aqt2-16Gt;
	Mon, 30 Mar 2026 08:26:51 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xQ-0000000Aqrs-3KBt
	for kvm-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:26:50 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7d7eb85fb81so4200128a34.0
        for <kvm-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774859207; cv=none;
        d=google.com; s=arc-20240605;
        b=BW04/cg/Fk/J9u1yu02Aa90gGrMaOfEo61EGDyQ6lIbzZ8g4pT644oWebV1pBJo+En
         AEcpz1k3YiCKVP3GCx/OesP7hVfn3UpBDOX1GlEz0MQeI97OSIQdSiIAX25J1vGDUykD
         6zv4Lahqk/C4xVisTvR3hIunm+EnhaGgiRluL3CGEme8QZcNP8Omvh5/Q15ztlPSNJsZ
         O/c/JfCqw60WRJZERPswJbLQ/U2igjoXZFIp37SOrTG16uLPF5LUg5XQpmVqB2Agywkb
         GyXxj978O4LFTxY0xgdumfemnVt/DlOs5TStJ1GTHRXX0dvu+zMfkCiNQkUsUaMMoY4j
         uwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gohPRZM3Pl5gGZYd1SEWk3NT0Z9V00jCIRMY1+DdSI=;
        fh=j4jBzXwfVtDOlQg3lc9XqF2KnyWV/AZz3amhrwoKY04=;
        b=cANJQDlqkFNRE6LeW5aDIrhzhkFp4XrQ9DQIPqa3Qrq2CMkFV/h5mm+c00idd+P2Vq
         5kJjQPURe3zBaNSHCopGBJHhh/pC+fhUguhzkBU0AsOp1kcun/KrCgjQInA4dHi3Z8zw
         NJFAyz79MU8mkVPXvhIjrP7io/0Yv0pDiu6ekJII97sFkakU90k8KVqpDZfrtlNufQqj
         pZDo0o9BJZgEd5xTQucPOnFnzGlgPlbmeQPcSdtBMJAJ2PNYpxqng4N690/wk5dhK7fe
         ZZlDpfL0cZhwpI28qGLPSgOQVSz0MVnGtUNEOK4zYgoZPQk+6xJzyNqodf/yq7kC99Sd
         yslQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774859207; x=1775464007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gohPRZM3Pl5gGZYd1SEWk3NT0Z9V00jCIRMY1+DdSI=;
        b=za+l8NJxRhjUhlXsjU6SQKuFzlb1gOXmSl8BEwMqIt9kRIXFa7thdYhNfvzFKpn9+b
         Cu21xFAPoCZhkxNYOwMYnZesCxBBo/perGZ+OTR0nUQbS3DaE+5rGll7eRURRcJfolQD
         4OXCEIgtlljEW6O4ar38r9OwbxlcoLb0q/Hbih73oVsJJyIYC5ZUaQYD0qKYIlCr1XAz
         v0YHvd0kD0m85Iucvx9GzX+vlLfU6ds3tGoGazXxIelsRLLU+SlETY9hQ+WUpH/LNmQJ
         0boofR92D/JPnBcE3l98FDgjCRtgdGdjTO15KX4dFlKfxDk1fDizaA0AP6jL4ObmNyDG
         kKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859207; x=1775464007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/gohPRZM3Pl5gGZYd1SEWk3NT0Z9V00jCIRMY1+DdSI=;
        b=b3ErjNInl9Htp86j2fbKf7k3fy7Ra/SiGgHg39PBgnRtuSLwmAuCioQzRS1EeEDMvP
         PasMPoCE6f5yVmSOJ8fHjfxxsMMRUzxiGUKqHmdiN8Qm/0s02MhEK3h9BFhz/PHAdB3+
         1F+njRqabUs2LsUrfjd43HP8Oy8TS2ze2qVWMxF7jFDegBG1zzmN/++gwPx07vomQPai
         s/SRfVXUDHmI5fkveCVrH2mcm7bNn4bV8zM86woJzRqnFHBEIwxoUliqn2lV4jQ/Tbkn
         H0MIQjR59NA8fvSNN03xn+WCKLy7ESUqSAVzx2/p43h7uEu/K93KnrFRbGqkzyY/3owO
         Z9zg==
X-Forwarded-Encrypted: i=1; AJvYcCUIijphumaoqBRHFlM8Hk+MfNYTTv0isCq56NRqWW99B/AWvcwGdI96OW6bh3Xiq3XfO4hLuVwtyFc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMWLxUhyYftT0ZBhmOZ06OC/5ZhYZzJ3hicz6QxDhU+C8WBozJ
	hN6cOtBX4prqSmh+cobRtO5GI511FbRwZNXp9WUiKua27XvBh4k/FjwRUPecOCp6rCDumjaElba
	R4NwFq66+KBPsaGeNhS0jZwXEonkbGAKur1UVjYjQBA==
X-Gm-Gg: ATEYQzyb4rTYb0EFBxXMm6CuLHAaDQaupTtIWO59VBh+Iu4So/kr0XcB1bAjUjeMtLe
	/tmt1ITXHyomh8IXRUAiLduZXxkCogDBwIZwtp4AoLGj0jOlwKR43swkbGnhVcgJ3wWYOHcMbJa
	PttZLJyBouNOMnWLl6YgXWC9EH4h6dPK1sKLd+2JKw4REkZ9/eNvDyoYrM6JkFS0gFD07orP2cH
	VqBTn4ci8S/IlGQjK3zaAF+XZlpdqoDYex9wGURvlxLH9XeO8V+XUOVm1UO+z/KdOopMl1yXzLp
	eRgwnkcWdxt5/E4nEI/ylyTzas6lpIhrUNPDB7PB7CZMdhlzbCOZdCscXf950l/01YAB91MsqQr
	v2SXBqVPoOgZviNMoXmZuJrbuHQ==
X-Received: by 2002:a05:6820:f02f:b0:67e:2013:aa49 with SMTP id
 006d021491bc7-67e2013ab10mr5470274eaf.61.1774859207468; Mon, 30 Mar 2026
 01:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260317114759.53165-1-r4o5m6e8o@163.com>
In-Reply-To: <20260317114759.53165-1-r4o5m6e8o@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 13:56:36 +0530
X-Gm-Features: AQROBzBNAoeEH4dtJiurCDIIFIldpeiaCAUkebJle2PJfQjHD7l832yD7YxCj4E
Message-ID: <CAAhSdy21XejojvdgkYdqO-40iF9AfN6k1Nx8X0PSpmF2D6_GzQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: kvm: add null pointer check for vector datap
To: "rom.wang" <r4o5m6e8o@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yufeng Wang <wangyufeng@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_012648_984447_2AEC3E85 
X-CRM114-Status: GOOD (  15.61  )
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

T24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgNToxOOKAr1BNIHJvbS53YW5nIDxyNG81bTZlOG9AMTYz
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBZdWZlbmcgV2FuZyA8d2FuZ3l1ZmVuZ0BreWxpbm9zLmNu
Pgo+Cj4gQWRkIFdBUk5fT04gY2hlY2sgYmVmb3JlIGFjY2Vzc2luZyBjbnR4LT52ZWN0b3IuZGF0
YXAgaW4KPiBrdm1fcmlzY3ZfdmNwdV92cmVnX2FkZHIoKSB0byBkZXRlY3QgcG90ZW50aWFsIG51
bGwgcG9pbnRlcgo+IGRlcmVmZXJlbmNlcyBlYXJseSwgY29uc2lzdGVudCB3aXRoIHRoZSBwYXR0
ZXJuIHVzZWQgaW4KPiBrdm1fcmlzY3ZfdmNwdV92ZWN0b3JfcmVzZXQoKS4KPgo+IFRoaXMgaGVs
cHMgY2F0Y2ggaW5pdGlhbGl6YXRpb24gaXNzdWVzIHdoZXJlIHZlY3RvciBjb250ZXh0Cj4gYWxs
b2NhdGlvbiBtYXkgaGF2ZSBmYWlsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWZlbmcgV2FuZyA8
d2FuZ3l1ZmVuZ0BreWxpbm9zLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuMQoKVGhh
bmtzLApBbnVwCgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+IGlu
ZGV4IDQ2ZmJmNDhmMjUwMy4uZTk4OWNiOWYxYWM0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4g
QEAgLTEyOSw2ICsxMjksNyBAQCBzdGF0aWMgaW50IGt2bV9yaXNjdl92Y3B1X3ZyZWdfYWRkcihz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICB9IGVsc2UgaWYgKHJlZ19udW0gPD0gS1ZN
X1JFR19SSVNDVl9WRUNUT1JfUkVHKDMxKSkgewo+ICAgICAgICAgICAgICAgICBpZiAocmVnX3Np
emUgIT0gdmxlbmIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
KyAgICAgICAgICAgICAgIFdBUk5fT04oIWNudHgtPnZlY3Rvci5kYXRhcCk7Cj4gICAgICAgICAg
ICAgICAgICpyZWdfYWRkciA9IGNudHgtPnZlY3Rvci5kYXRhcCArCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChyZWdfbnVtIC0gS1ZNX1JFR19SSVNDVl9WRUNUT1JfUkVHKDApKSAqIHZs
ZW5iOwo+ICAgICAgICAgfSBlbHNlIHsKPiAtLQo+IDIuMzQuMQo+CgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
