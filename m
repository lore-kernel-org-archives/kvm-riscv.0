Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9062BC53200
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32eX1vO+xCAOclG/jwqzG7pydKP/tHngbFwTEc2io/I=; b=T+mBgsg2PtGoPo
	8aE5iD5ipLSg1jrK/lA2G20trces3DXfMDCNikHtrnDywf/XZkoG/4ObYU+Z+p2DIN4NtRzB6zFXr
	R5+EfA8D3HWNwUiJZczaDw9RoU2a5MSEnfvN7YRGRMZvCBlxycMioubk0N+uu0p8MA3aBaq6LM/Ew
	UK4JVJJ4TWHOD3rde+vf8E1395UeaQ6jZzwGBzT61QTeJCc78rDXOolzBkzdaD3h/O0CeC7ZGrFvA
	KTs32RAY91j55Lv0rY2WsD4BZe7N3ndQ9ENiijfa3qsABA55QVQ5NplhOpLzD778HPgTXZyXgx9GG
	0As7b3I+MziJGcx83LSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3jd-00000007xaS-0Ss0;
	Wed, 29 Jul 2026 12:50:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3ja-00000007xZO-3Mll
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:50:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so985394f8f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329405; cv=none;
        d=google.com; s=arc-20260327;
        b=DLMenZOVKZ+rj5KwaK1KlXytG2DwJZmexQ8JgHRc5ECQ6vqH1wLFn/2P0B9apiNFWz
         g/eaq8oAHFWYKMcLwgdt4IsJyiQBr0grDSfWroDdPXTdPM2YC5cZH9tTc5RF/R+NDL2E
         O3qFgIVP1Kk+MJJt52v1de6nyLQOQEIRdspV8Kb9xUrP7Qb22lVaWdLe2ijyINuWKcFl
         AW1FrUNP/fkM9gzXLKpV8fiuJx7K6SyHi4VZjMNvUiwlV907fVHgTVTksaMhYhYQo6AF
         u9x2y9+I5lgBE7myJ5yc2BOrlJv7BVqXEByNmt6AEuMO5CVtxnEvqiXmSYHcugP+0uGH
         vDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dx/CmVrpueSln+pSRsdy5aEFve/DvptB38ixtepw5a0=;
        fh=7rVH6bdT31I/rqecunpqz9tcZCptKp3D9Gz0+XWJM/8=;
        b=l4OsZJBzGnfXmz3aj5724VVp7cf9Z1CrBpBE6bQChSm/IkbOwW8F+uEhBk3/r20mSy
         /gWfW10eLDliUkMDbNnCP5IICxWhmINqXmOyb/dcMjMj0EtDXwK2XRuAGIDNkX+6QG88
         j77fKcpBLazMvNJUaY4Uv/iRANLj5/wWaY3btx/IKe7SiUsKmUMAIyRwy17bn/Y3Xrle
         K9xeRZN7aSEVm8lj1GUU1jz892Deg5YfVBoDbOCSC7vmPp5nAWXsr9DJS63uuhzLHV1z
         fsU7k03VZ+Q3+Iqx0qRe51UK+dRfoz5Y28VZjubeUlMAGaHrPP4xF+uNpcGDoKXcb2Rn
         niaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785329405; x=1785934205; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dx/CmVrpueSln+pSRsdy5aEFve/DvptB38ixtepw5a0=;
        b=uhRDVPVv1NCEEAGf9kuo8snPPyr4Vu1Jf6Z3fFLK5DiGpy7bScuJB0unHOEjKF5yci
         1Ek2dbB2OokTpZD+CNML9HZyef6rxRy55Hnd+g58iwnouI4GLtNX2qoritf8/biVRdW5
         Z55vBbeOAF53YdImvl5yyOpj7BIXtHLmV+9NaxdbM3o0H9UW0Bmu5DRD9WNkH+xAEpSr
         EgPUx+MwnN5x3yv5zTkeGC18LYRyj7p4x+Qzjbj3qahlgS08JltufC0Pc79RhmkQ2P2a
         N/WGg//v2309AwrUAm5p0wMP1ZIu3TDZ1xiBhccDGSdVJExvxzYvMvw6gSB/Yx45caYQ
         F62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329405; x=1785934205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dx/CmVrpueSln+pSRsdy5aEFve/DvptB38ixtepw5a0=;
        b=Wn/om8WD1X1Xx0Io5kvLBKf6z8JDsNdEJ/jhYPCZLFjgS/6Q8EAGEArzSNUsMpdVi/
         +8BES+zqXB7aQ2Lal0F3/bsjVPxGSdVYfguIKZthgZyD7Sr4HTcXt327AFe/1ix1Kudu
         1ctD/muYtwCP54xy5Bw8rQ0FMhyjRW7BaIhwu+olSzcG8Cyy3H/FfL+Ncbvrx3LiIW/5
         LKmxsXqbyG48cCp+cEHCsa4dPHkb5ElBVcTrgO+9iBv4jAdtBaXjFmEmJ1icHEYFyjO3
         GyiWu1I3U39hhwYgfcnoz0EkZ5SVL9Yun3LnAnnk2Bn8/pM9t8oecVZfQ1WfXu7H2fwu
         Nbqw==
X-Forwarded-Encrypted: i=1; AHgh+RoPlVJSEh7SQaWrIyq1FSlICTHspyWFpFNzGMq57JCxUx7V4DkiafhpiLnA2+pkTVSlVVCdCmTBeZs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgR85FhA1GWSRxBdJ4cftOZfC/Lops/3aITyKj5RA2cxnaJCTO
	KnTwy48BdpBwfAFIBXxPN27j8dknq+R3A5i5gI3NThd1zPN9Q1Nkd5HyXuBXl1Lgx+phFqaX3lO
	o8+XP6C5jrFeFNG0ogHQyvx2ENXtxwvsjIGXh+e0KjQ==
X-Gm-Gg: AR+sD12iMCr2JM6Vgm4OC+uOLFSWaFN+Wy83onSe3TXKucbQOLx3+JjuRPiTZWDHD9A
	s6z+nJjDD95Vyje00oiciMbsKCyqu3PIn1iQMxJJLQJorUCXDvOW3HlfIwj1bJrczW2Z5BRTZ1t
	u006YrQG3IJDj9eLHveqYSXKaK9ZyaXFyK4uFSjzSa3HmAlLn8ENcLqPNp9YIpUlIWLQC6KDfU1
	FG+avMofHUcu7rpFtRYhE6lPvXm6ajAXhOBAvqtQvbVzNue1A3jNbO9Wk4LEwA+GWGfXeKJ7Eve
	H26NH539hLISEGd2re5YnAf/urWwZLssNK2Giypfs3kCPwpsb3ntBMlFekmdIFJIrOsEsH1CAdr
	GuYlRFEALR5qpWclkSm6HsEzsWgdcNzWVuRjhT9MLEGR82GZCMwFyrM/v0OeyiQ4=
X-Received: by 2002:a05:6000:4310:b0:473:6e8d:7f3 with SMTP id
 ffacd0b85a97d-47fb1e8282emr8113564f8f.1.1785329404905; Wed, 29 Jul 2026
 05:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-4-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-4-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:19:53 +0530
X-Gm-Features: AUfX_mxIAIAYLjpHcgaD3ozqXoaXRQtjaEsHbcis5uT8wvm3w9BPM7ZLbion2z0
Message-ID: <CAAhSdy2xe7DBRY0bhM1S0G-6ebEEi5y0x9fS3YFUC6D7bN32LA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_055006_860230_2D68C32C 
X-CRM114-Status: GOOD (  12.51  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNjozM+KAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBhcnJh
eSB0byBhbGxvdyBLVk0gdXNlcnNwYWNlIHRvCj4gZGV0ZWN0IGFuZCBlbmFibGUgWmljZmlzcy9a
aWNmaWxwIGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNLgo+Cj4gQXNzaXN0ZWQtYnk6IFl1YW5TaGVu
ZzpjbGF1ZGUtNC43LW9wdXMKPiBDby1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5A
aXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5h
Yy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29t
PgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoK
VGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgg
fCAyICsrCj4gIGFyY2gvcmlzY3Yva3ZtL2lzYS5jICAgICAgICAgICAgICB8IDIgKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmgKPiBpbmRleCA3YmJlYTg4MTJkOTIuLmEyN2RlODUwZmE0YyAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmgKPiBAQCAtMTk5LDYgKzE5OSw4IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9F
WFRfSUQgewo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkNMU0QsCj4gICAgICAgICBLVk1f
UklTQ1ZfSVNBX0VYVF9aSUxTRCwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBTEFTUiwK
PiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pJQ0ZJTFAsCj4gKyAgICAgICBLVk1fUklTQ1Zf
SVNBX0VYVF9aSUNGSVNTLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAo+ICB9Owo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2lzYS5jIGIvYXJjaC9yaXNjdi9rdm0vaXNh
LmMKPiBpbmRleCAxMTMyZDkwOWNjMjUuLjk4NTJhOTFmZGVjYyAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9pc2EuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2lzYS5jCj4gQEAgLTY1LDYg
KzY1LDggQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7
Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklDQk9QKSwKPiAgICAgICAgIEtWTV9JU0FfRVhU
X0FSUihaSUNCT1opLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJQ0NSU0UpLAo+ICsgICAg
ICAgS1ZNX0lTQV9FWFRfQVJSKFpJQ0ZJTFApLAo+ICsgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJ
Q0ZJU1MpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJQ05UUiksCj4gICAgICAgICBLVk1f
SVNBX0VYVF9BUlIoWklDT05EKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaSUNTUiksCj4g
LS0KPiAyLjU1LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
