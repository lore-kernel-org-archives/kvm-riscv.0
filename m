Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A129F51415
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 07:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OAhNhT9kmOXbSieR9huQMkMpDEM+WCRp74bK9oWqy5M=; b=Tfq0hFjQ+6ujII
	PjtMmeg5msI6QFkzDsMgajCBRtLaW+z8JneO3WWwSufMD3x4AdIKH+yUqeZNxaoxNmQ76+L404CmT
	z3fFuudByAcRtN/RCYVa6rL3x1+rlERH8gVC5VizbGRvWWjys2YXlc7l8dMKKVJZQ+GDz6W7S1jei
	XKOwc3rd/04w+6grRoqdPUy9GlB040Rsf6MDnAoNYu97z5jLYY8A7aXhON1gZ1y1WSsUeMUSnZNZg
	S1sJhGvw/9/GXcF5if02PZRIeNkXDaGp6tKr7QtOazI/PD9S2bsZUeLtDmqAcdD3ZOOZdWdV8bXP6
	j3evH7JBQG9GXJYzBLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEl-000000037aT-1Iuk;
	Fri, 06 Mar 2026 07:04:39 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPEh-000000037Z9-3zcM
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 07:04:37 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7d4c307db9aso5596270a34.3
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Mar 2026 23:04:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780675; cv=none;
        d=google.com; s=arc-20240605;
        b=ijsOGn8F5PUABqIXaoiyH6PoRGSJd/fkcTm9TIidnN3ybfZCxmGy0Xy0yfGWpq9Wnh
         cJiimo3me5rAz28d/5+BbdEiR5lJhNQOCupRL8An6/afAiHJ5ZFK1CS5Sg4sTh9GUwHW
         WBDev04qwjdOUGjUmDAtq0uBs0Lsb/v/TR7e4PWU0wSbGELgBNJVuFGYTx3RWcVrZLL0
         Xe4gCW7PwPV/DtYIGeeS0Vy20DKedSXJflqHmap05LD05+js9KtN3qUr1yE791+1wP/d
         lmMiU+bfcWK+d7k6YKF+UOfxUNuuDvctmjxQxRHEAt4zOQGODe5RDjk5rWZi2XeTZ+iq
         OUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivXnTCaqI3lRQ19wdmdY/Vg2LOO+anvFx2bukYGj6N0=;
        fh=F0ZMfFFKb4pzhYmvjR94PPEfAUVRIgGcD+2NYlqTTQ4=;
        b=V62CgofPujo1S64T3fi6CbqXaVnYiysFZU7n5eMwXjEqstCA/g017nmLxANyXqXA5t
         WlD5RZ+2pNrv3E9OyKfdGgPgDp3bzTNVTPUuiBNrNxXESLwsrEAUiXdCdnINXX7Uk3Tl
         pVtdxSanqSSE0ensCxo6wXn/m/5XKVW833lJxuvy/EP2cNwyRql+1zibTKNMzLVsHXNW
         83yteTJIHMhD0LPmsNrUkYifa8hMB/QlB4cOUNB3EBkJgxV+2WZhZdcVrABXFF+LdkRp
         AjLxzDoclTUGxOjU3xbOhIgzvF5TNnei0x4qtE6cz9CoKlOsOWrKcKeu/otAdzBWCHJe
         50Ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772780675; x=1773385475; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivXnTCaqI3lRQ19wdmdY/Vg2LOO+anvFx2bukYGj6N0=;
        b=IiirU3JUbnx7C1pqy4wlmdve3OqpqHPM15g/cPapIaQQG8NmWJFkZPrwUpoo7Ke3O+
         mAB4KCzUCdlxW23kcrp0TeD7KnDTAZEa/umbwBT0tHe237bUNh7BbsHR+3/hbeakx/uC
         y6bzEXaYvOOlkQLnrzbvoOA2sEkQMGD6SQd180wd+Y4U3ArJvrYyuxY/HvzO9xUhI9J5
         1J5chZCFnRy/bRO8Nff4SUyW4bY7OlsPwHACXDTyTIiBdWYr5IGp2p5zs9o1clarJ6n/
         jZOuI0TUB1l4NkDJalmZ86VOquhg8Zf1MTQzRmmmhDcbKh79OMB2QIo10Fn48RVLn09f
         sfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780675; x=1773385475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivXnTCaqI3lRQ19wdmdY/Vg2LOO+anvFx2bukYGj6N0=;
        b=jtRbPxI6V2Orn1P3B4f68Rlv3g9PpzvMPEAj11Ib0FOwSQP4xNxd72w4M+Pi6NMPE2
         SyzG5n/+40Lfvo+2oA5Sgy6nOborwxMko6pgntfMhsjFjWrE/2VJQsqdBeAMHB6Zcb32
         ffqOpzu+1a5ypNmKCpnhMrSQ/5JrlqRFXCcJWKlfrU7iw//bHewTUoeAguzjjQOpCJnq
         Lez3/DEcrKW60q8OGh3hqa7VHiX0NiDPyMVt7AQ50oJ4y4bA7XwTIVP//5jC9tFqk/Vc
         bzbbJ9h+4/0XyTJHLWFt/GmuyE/5bhh+HFi8FmiwYFw2dIs/FNM1lwgy8REHo5Icsg76
         uunQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtkystTYFcBc/Wl2ERwWZX9XVOoij8nEVoO2BLhXbmXVUR58TTMctrk8pWwFfNdqviS6ZK7Cf18Lw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzD3KlmK6B5J6hM4aqmmr29939RFWDkvzgB3FiB6AysiuNfYLlZ
	ZO1Cdwpqiru2KHdRug3wVpqXxK2dcvpa4tDabTezQpTaUtUKySipLcdgeLDerdDAyZZhcZuUvdP
	K/XEnRbrflCgnAs3AXj9nW5uek/msJPSa5v1dyEl+Qg==
X-Gm-Gg: ATEYQzzF3YVmYioCCBwc0mSKuSU/IdnL14ayZtQLba3oF5gKAJ2wYlQPyP6OAcFJ7yF
	+LZ1S1q9O/zzYKqgXBQDpfrVXIVchHCiF9KFaPyJJzJFrAn87cVwu6u1wJ3SmVL+lciFdmGkzHR
	OASBVoJ7Sk//WX1Dz768XYXw1hAoR6V/3F5Ahaimh8uXHYYEk4sehBcms62gMXhYWYUTW434hLW
	O31YctRcW079Xjc0ztP0BGkCPFdsnNxhwo3lacYFld8Vx+PEjix8JlxzriDgE7EKFhuTRf6CN7c
	S3yRtTbz2ygFdP4xaLFXcnJ0yyffROPqgxMhQid52IGdgyJSIN0LDLKJrJL0wMJUnxLuGyEsB2l
	ChrRc1EkekyALqbRWBbTgfdv7tg==
X-Received: by 2002:a05:6820:1787:b0:675:2e2e:569c with SMTP id
 006d021491bc7-67b9bca66c2mr902114eaf.25.1772780675004; Thu, 05 Mar 2026
 23:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com> <20260120080013.2153519-3-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-3-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 12:34:22 +0530
X-Gm-Features: AaiRm52sAuSfM9cJRWnAGnwsD5n99Tkn6MwnQdCUOUYqaB6vd5qGlGeCvH3Tt3k
Message-ID: <CAAhSdy1tMeD2k4DXNd3m_qgrD+VOOML2Rd_q-ykcLXPv0UzMiA@mail.gmail.com>
Subject: Re: [PATCH 02/27] RISC-V: KVM: Fix error code returned for Ssaia ONE_REG
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_230435_997568_78AC6541 
X-CRM114-Status: GOOD (  13.63  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMTozMOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBSZXR1cm4gLUVOT0VOVCBmb3IgU3NhaWEgT05F
X1JFRyB3aGVuIFNzYWlhIGlzIG5vdCBlbmFibGVkCj4gZm9yIGEgVkNQVS4KPgo+IFRoaXMgd2ls
bCBtYWtlIFNzYWlhIE9ORV9SRUcgZXJyb3IgY29kZXMgY29uc2lzdGVudCB3aXRoCj4gb3RoZXIg
T05FX1JFRyBpbnRlcmZhY2VzIG9mIEtWTSBSSVNDLVYuCj4KPiBGaXhlczogMmE4OGYzOGNkNThk
ICgiUklTQy1WOiBLVk06IHJldHVybiBFTk9FTlQgaW4gKl9vbmVfcmVnKCkgd2hlbiByZWcgaXMg
dW5rbm93biIpCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPgoKUXVldWVkIHRoaXMgYXMgZml4IGZvciBMaW51eC03LjAtcmNYCgpSZWdhcmRz
LApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyB8IDQgKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0v
YWlhLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+IGluZGV4IGRhZDMxODE4NTY2MC4uMzFiYWVh
OWYwNTg5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vYWlhLmMKPiBAQCAtMTgzLDYgKzE4Myw4IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9h
aWFfZ2V0X2NzcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBr
dm1fdmNwdV9haWFfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5haWFfY29udGV4dC5ndWVzdF9jc3I7
Cj4KPiArICAgICAgIGlmICghcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUodmNwdS0+YXJj
aC5pc2EsIFNTQUlBKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gICAgICAg
ICBpZiAocmVnX251bSA+PSBzaXplb2Yoc3RydWN0IGt2bV9yaXNjdl9haWFfY3NyKSAvIHNpemVv
Zih1bnNpZ25lZCBsb25nKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4KPiBA
QCAtMTk5LDYgKzIwMSw4IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfc2V0X2NzcihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9haWFfY3NyICpj
c3IgPSAmdmNwdS0+YXJjaC5haWFfY29udGV4dC5ndWVzdF9jc3I7Cj4KPiArICAgICAgIGlmICgh
cmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUodmNwdS0+YXJjaC5pc2EsIFNTQUlBKSkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gICAgICAgICBpZiAocmVnX251bSA+PSBz
aXplb2Yoc3RydWN0IGt2bV9yaXNjdl9haWFfY3NyKSAvIHNpemVvZih1bnNpZ25lZCBsb25nKSkK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4KPiAtLQo+IDIuNDMuMAo+CgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
