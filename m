Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20321E77188
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Dec 2024 05:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxW9VEiqj8F6PnCtWbwzMvibDnHBi69zZAQjlEKxz1Y=; b=HtjzF1Q44nISct
	y3ti4IWLbiF64G3PkbLm16/rcltDmmGPCOq/ThkowpiFtpFFcG5Ycc0lVMP4azLiUr+BBb7uhlIRg
	VomG608JCu3enXZBy3bW0pIjZ7VJ0vbbPJGQaHCIrUwVhD6lUhwfX19Qx5sPv/qwe32xKGCdWtYGn
	+U5BJ8en0EXbe+oUaWl0Ov9BGYzdG0/+67wJqzdVIRSfWI5GnTAiGI55JIdWuedMiRMV0Z6njcMgF
	WA/1vJ4G0bnkHV8K8qHpN2N/fnyDdLpgHofPUVoe40z1koMgYHKIFsY5FdrsJPjhuLXNz9HiT6po7
	opH6CtCky1R+1UGTZCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQggM-0000000FEoo-1k5A;
	Thu, 26 Dec 2024 05:45:14 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQggI-0000000FEnn-3Iyx
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Dec 2024 05:45:12 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a7e108b491so54201735ab.3
        for <kvm-riscv@lists.infradead.org>; Wed, 25 Dec 2024 21:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1735191909; x=1735796709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtyao9XCxuyrcti0Hf6VyClk0WR8AztwUzkNYeymagE=;
        b=pS++N5JDSq7V790cdLlQIfVIJOPd/MRKAtcpGiMMkEfXhfcyNUkpYjiKCe/j+86K1F
         L/SdToio9x/qgMKDfStJ9DytZv5XXGhaeWDl6b33Ov9YEkHVOa63Pu9b01NQtGqiZFxL
         Zl7zlRWtbPftFP5fyL4sdxpQNuycJ0jCNx8it4hXilPhFfSTUHMczOSus973kbg4o+FK
         5NG1TEgZTBB+7Pd7SP1OnON7w6bcOM5f6KUudYDKWjA8q2xiLCCms8/rnzEK7WRKHnpC
         EvkV+WLhckzB7w1LpNkds7pR+Box1p9tIt4FXLh4mfJijYwFhIgkAikxrr6Hi+9db+Ph
         GEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735191909; x=1735796709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtyao9XCxuyrcti0Hf6VyClk0WR8AztwUzkNYeymagE=;
        b=XkCbg9sGTEIZpPFi25VU3B/v9c5Rgbw3+HGFv6xaMJkSC26H+8UnT4Qy43cc16CIL5
         X7M9nPdrITBO9bqNZzwyd2gz1YKyvNP5boOCEHvYxFxqMuzvWgL8gv5ZEhrTLjR+3oYz
         TuHV5FqdOsk/OSGR+ccZrtQWahCoZ/l9jvhRBPaZAbSCmKTfF/3C3wz0touhJBWSOfBi
         xy142FUUOHRHeTfNHdScbTYa0Mzf4yV55VIXq/zKxNRRPmNAxIT2JlccjTq2z5pRzzqb
         jQTUSPoN8c3Zd6AiMDUu/VpFWFSq9X4EPvXxPTTimk5jYekRaBvSWv51xgfpIk54pzr/
         9dqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2LD7ZQFcpgAX+UnL+tfmJV4o623vFPGRfgQsQYveJTl7Jg1lxNA4zuTClVuZNOsqjZWI1XRws38Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5sO8ho7xUv3KdHrWsLYUCUfuOo0b5Kc19E4R3BZLCihdRVhDa
	jyku6RgbBfaNj1nREkG/j1It52ZBRX+ykmwviyJWOVHzuAJRljj76UMyr/SDMdlWIHl0TJ4tp08
	DhkCWcVBuF3TUJZSn43ajPh8weQcVgxxKbUX88g==
X-Gm-Gg: ASbGncsSpx/eu4X5DzJWYoyibUCSGUtUwR8WdaE+un+GGqfbERJtp7rkUExHVG1RBQG
	fxhtTS/s2fK0Wdp82Te4oIEVV4jMa6NmucUGmbqA=
X-Google-Smtp-Source: AGHT+IH6nTvJDAU6yLG9KF1CpMHiiYEaH6tsSIwR7GjbeccZhTbSi1E4UP7pA8+hFaBPCq5M2TKrAVu5a9b2j+IbiRM=
X-Received: by 2002:a05:6e02:2185:b0:3a7:c072:c69a with SMTP id
 e9e14a558f8ab-3c2d1c919b7mr205304125ab.3.1735191909080; Wed, 25 Dec 2024
 21:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
In-Reply-To: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Dec 2024 11:14:56 +0530
X-Gm-Features: AbW1kvYzlavyORKjBXtG1i2VfPZykEW7uxAUbLOaIZK7inugX45lU3EM1rz5dco
Message-ID: <CAAhSdy1whfogfDAZaDK9YCTSFw_+qYR3+nHGhAg=3EqZ-_4E1A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Collect guest/host statistics during the
 redirected traps
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_214511_023032_8C7C65BE 
X-CRM114-Status: GOOD (  14.84  )
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

T24gV2VkLCBEZWMgMjUsIDIwMjQgYXQgMjozNOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEFzIGRpc2N1c3NlZCBpbiB0aGUgcGF0Y2hbMV0sIHRoaXMg
c2VyaWVzIGFkZHMgdGhlIGhvc3Qgc3RhdGlzdGljcyBmb3IKPiB0cmFwcyB0aGF0IGFyZSByZWRp
cmVjdGVkIHRvIHRoZSBndWVzdC4gU2luY2UgdGhlcmUgYXJlIDEtMSBtYXBwaW5nIGZvcgo+IGZp
cm13YXJlIGNvdW50ZXJzIGFzIHdlbGwsIHRoaXMgc2VyaWVzIGVuYWJsZXMgdGhvc2Ugc28gdGhh
dCB0aGUgZ3Vlc3QKPiBjYW4gY29sbGVjdCBpbmZvcm1hdGlvbiBhYm91dCB0aGVzZSBleGl0cyB2
aWEgcGVyZiBpZiByZXF1aXJlZC4KPgo+IEkgaGF2ZSBpbmNsdWRlZCB0aGUgcGF0Y2hbMV0gYXMg
d2VsbCBpbiB0aGlzIHNlcmllcyBhcyBpdCBoYXMgbm90IGJlZW4KPiBhcHBsaWVkIGFuZCB0aGVy
ZSB3aWxsIGJlIGxpa2VseSBjb25mbGljdHMgd2hpbGUgbWVyZ2luZyBib3RoLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MjoKPiAtIEltcHJvdmVkIGNvbW1pdCBtZXNzYWdlcyBpbiBQQVRDSDMuCj4gLSBBZGRl
ZCBSQiB0YWdzLgo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0
MTIxMi1rdm1fZ3Vlc3Rfc3RhdC12MS0wLWQxYTZkMGM4NjJkNUByaXZvc2luYy5jb20KPgo+IC0t
LQo+IEF0aXNoIFBhdHJhICgyKToKPiAgICAgICBSSVNDLVY6IEtWTTogVXBkYXRlIGZpcm13YXJl
IGNvdW50ZXJzIGZvciB2YXJpb3VzIGV2ZW50cwo+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQgbmV3
IGV4aXQgc3RhdHN0aWNzIGZvciByZWRpcmVjdGVkIHRyYXBzCj4KPiBRdWFuIFpob3UgKDEpOgo+
ICAgICAgIFJJU0MtVjogS1ZNOiBSZWRpcmVjdCBpbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQgdHJh
cCB0byBndWVzdAoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjE0LgoKVGhhbmtzLApB
bnVwCgo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICA1ICsrKysrCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8ICA3ICsrKysrKy0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdV9leGl0LmMgICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IGZhYzA0ZWZjNWM3OTNkY2NiZDA3ZTJkNTlh
ZjlmOTBiN2ZjMGRjYTQKPiBjaGFuZ2UtaWQ6IDIwMjQxMjEyLWt2bV9ndWVzdF9zdGF0LWJjNDY5
NjY1YjQxMAo+IC0tCj4gUmVnYXJkcywKPiBBdGlzaCBwYXRyYQo+CgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
