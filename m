Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9056ECD6E5D
	for <kvm-riscv@archiver.kernel.org>; Sun, 31 May 2026 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owPcCxe+rkiVjiIrz2vloyCl5FZNtx6J8C/HmDIUj6Y=; b=GZkj8WSUwVWMlK
	1Z61Fh6RgsRgJoa8ARkUQITYAsRPtezz8gaYZ84PP5MDx66mszLeynl/rXUvODoe9WSzO0Y7AVAn2
	5k9arksBF/KPDjYAcewcMvPYPr9NyXGduPF+oHUhiQhm2uOHil6r+QTWO6lyd9AIXp68LgUrP+efv
	yYdNfl3lKmxn5JafwtLTP23os/U0yJJd7+hkyhoEEuqH/fqcL34yqmRnqPueuMhKH07YB3M41rnZz
	JVZ+3uJ2ECv9ui2l/F3LDyCmKFrACOUSAkoCWqnh+lIxvIU3son24Lj4z7pm/vzTT9CsA7tkyNysX
	bj+8zqGQizj6hrp7hcDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThqH-00000009g0V-01wU;
	Sun, 31 May 2026 15:12:45 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wThqF-00000009fzi-1Zly
	for kvm-riscv@lists.infradead.org;
	Sun, 31 May 2026 15:12:44 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7e6b5e09a96so395770a34.3
        for <kvm-riscv@lists.infradead.org>; Sun, 31 May 2026 08:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780240362; cv=none;
        d=google.com; s=arc-20240605;
        b=If79lp2sS0FJMEX4ti6F3VjCaSt1xeGPoBENxKbcWjRGGKLmczomqNY3+2Uvf9l+e6
         mfVuqeFY23GH051dRwP4cytUMmiNaz2BftFWNS/2qOHyoZxPo/UlZEXXwzxE2Fl2bPf5
         L2LV/rz0ah/8Sfg3UKh6Er6OewfdTHhaLl+KokUR64JyT/odjZ1RL7ABxCZr2Kz+Hx4R
         gZd/mf3N4tM8SlSaBTxUDgJHwppaRvutRaRr2BMaKq5Cs45NRub7qVD1ti7vOzIavIfj
         rHvjB0z5XgvoYeIcLYtb01zg0YpJpTVGqGCX8Hu7SBYPxnL3Rl631xUJ9CE4C0IE48Tu
         Fu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ht2YVEPAer5B0FIawUvEH7O2krIPHZoNfVeG+2PYK1A=;
        fh=9P3BKkQMIbUF7uUzNuvafXobbn3+pT92bXH9xYhq2gw=;
        b=RW0pLE0gRfZMfFOxp8EvSTkVAwci84n3rfSQ5JKEH00lxSf/J8TCXy+1Rk1sv5WtvR
         XRw1D5b6m62xpdxbLSLNT9FRxaFDn0Lxnoc+znI2nBmglyc9U0uxGgdYVT1tTQd5Csf6
         EKRyoUGdTR0OuMcAMorP2Fs0T7LrTEyaagaCny4tCaxh+07N7QENWjRKVGvG1lPd14z9
         EaL10xNEk/72tlaUMaGXFXb21OG14EinUPNO+cs2miGpdEBaiOxk0g4QOB54KVWcRLpY
         Vg1nCWugaFUALsDl5h03bthP7tbA9khC2DJtDhdgms5GIjWS9YzZq9eExjLGZmQdyQ/j
         kXTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780240362; x=1780845162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht2YVEPAer5B0FIawUvEH7O2krIPHZoNfVeG+2PYK1A=;
        b=VPmIsM5jO1eKV1FyE01+Upa+q9w1zuyNEaLwU2VmPUCbBec+h+q185PHsq5iQgS2oL
         yZhejggS5uVswEN97HYghpWdhGyGw/Ahtvi21jJVpyJvjxXvd5lLZSZ5u+gQaSNN5T4B
         YfVtJCvfAZDN/2HjsM6ZPx+vpy8jq7iY97kOjTBLIX8QyOzLFCvcqUktmMh8q7K9DzK2
         HA9NJ8MuAawcK2tkjaO0jhzi6M60TdbemCTWzN6SCUEOJwLKG9VfDhFPR8QrHMXS04SE
         Uyds3u1GbgEGacKaI7tiJt6ZIA4DiYzeaYoQo7yf1f5Mfk9mH6oDTY6NfVyxKioym57Y
         KFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780240362; x=1780845162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ht2YVEPAer5B0FIawUvEH7O2krIPHZoNfVeG+2PYK1A=;
        b=TciVbewLR5nH3ZIVhPcgJPMY+yqnAq05UD8s93pXavvgDQS+FEsk+tfCFzcumimC8M
         2sgxhM16D59U/1P0n+k2nRgZn9D+4hcVEXKVoPyY+hjnGxVE3zxKfMdvFDxIoUkVLKgj
         5YysNVg52ONBB/zUAiW841fjuUEjdq5eEmmzW9MQEzUk0EKNc3MCu2trWNRi9IQGiACr
         khg8p/smFs4tvaUOLDyek1h1j5Y7rSvhklP9GWK9U4nTsuqP6bAjPlwHtLaqCPWovTZI
         MNe8kZ1RWGcoKgU1OPijDAQ6PY+GR8LS5CtNmGwC3HhJ6pDJME55yW8fiZgoPTO5qfp3
         zozw==
X-Forwarded-Encrypted: i=1; AFNElJ8M5WcKIbpwkA0McHOa2jzNCa9xX+k9crWmQlTouLMtywVBec4QzQelvvs0hc1+Q8Yk0TfGoZeWaHQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfwC1dKfPH3JSXNXON3TluDMDep0QJQwd6w6peqklCLSAmhOlz
	TMb4/Sw5KIal3AhSZ9mHSqd2s7Rw52octJWxs+h9rcIrwTOEEpZwx82WPkC3d68CF1GD6iK/k88
	NJnoAiRVvjjmTvHu0ptxta7gHlPfJJ95GJmfPrsGxQA==
X-Gm-Gg: Acq92OHWhFp+FYciV07S7cyctZq9IQwt2d/ToifNT9jQGaPDBjyGBkyQaDtac4iU9At
	eHjp/OONSMzK+3RgElgQeYSzpipJ5bIv5sCXgMxSTkyAoQLh1sAUyux+D8AbAP+pAw1TEg/54NJ
	hLqVflqzx14v0BqixXKtrZEplx1mIOycb3+wrxr83g2nq2lK3AuyBeTnBc9Eu9Nj9Am5DulIsr5
	4mzFNUiARceqSbllfPrUfb2DSxvEWI1oEbrxzgHp2fwnRJ+BqvxN2qjzL99Vzq95izhxT4C5EuD
	Jwc1uzI+PwpbmNsn18klCUg5NY17ep6dQZifuzZAB5cXWUb/4URt5ZMzt8SK6hWWhY3IsAUlj6y
	DscM5b6DOwf7WAhICokvepxje3dZ4BFiSQOBAKg==
X-Received: by 2002:a05:6820:1a0b:b0:69d:f749:7d91 with SMTP id
 006d021491bc7-69e102c9f6dmr3770256eaf.7.1780240362243; Sun, 31 May 2026
 08:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260525095930.3924905-1-mayuresh.chitale@oss.qualcomm.com>
In-Reply-To: <20260525095930.3924905-1-mayuresh.chitale@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 31 May 2026 20:42:31 +0530
X-Gm-Features: AVHnY4LvLumKC5bI-Kcv9TET475eaFGsQW_NjeCOc_gBN7nA1GLTHdnMHDbUw7s
Message-ID: <CAAhSdy3fVaLOWhBYNOPdrsQziPQ6wsyeodrjjwE7ftvqty=2bg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix ebreak self test failure
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_081243_409712_C27F2C21 
X-CRM114-Status: GOOD (  14.90  )
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

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMzoyOeKAr1BNIE1heXVyZXNoIENoaXRhbGUKPG1heXVy
ZXNoLmNoaXRhbGVAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZWJyZWFrIHNlbGYg
dGVzdCBlbmFibGVzL2Rpc2FibGVzIGd1ZXN0IGRlYnVnZ2luZyBhcyBhIHBhcnQgb2YgdGhlCj4g
dGVzdC4gSG93ZXZlciB0aGUgS1ZNX1NFVF9HVUVTVF9ERUJVRyBpb2N0bCBkb2Vzbid0IGFjdHVh
bGx5IGRvIGl0Lgo+IEZpeGluZyBpdCBieSBjYWxsaW5nIGt2bV9yaXNjdl92Y3B1X2NvbmZpZ19n
dWVzdF9kZWJ1Zy4KPgo+IEZpeGVzOiA2ZWQ1MjNlMmI2MTIgKCJSSVNDLVY6IEtWTTogRmFjdG9y
LW91dCBWQ1BVIGNvbmZpZyBpbnRvIHNlcGFyYXRlIHNvdXJjZXMiKQo+IFNpZ25lZC1vZmYtYnk6
IE1heXVyZXNoIENoaXRhbGUgPG1heXVyZXNoLmNoaXRhbGVAb3NzLnF1YWxjb21tLmNvbT4KCkxH
VE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVl
ZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjIKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYwo+IGluZGV4IGE3MzY5MGVkYTg0Yi4uY2Y2ZTIzMWU3NmUyIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC01
MzgsNiArNTM4LDcgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X2d1ZXN0X2RlYnVnKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgdmNw
dS0+Z3Vlc3RfZGVidWcgPSAwOwo+Cj4gKyAgICAgICBrdm1fcmlzY3ZfdmNwdV9jb25maWdfZ3Vl
c3RfZGVidWcodmNwdSk7Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLS0KPiAyLjQzLjAK
PgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
