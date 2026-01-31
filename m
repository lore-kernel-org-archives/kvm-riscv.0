Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E266CE6BF3C
	for <kvm-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 00:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n45iSQC60y5bgdWAIHrK8psr9VnIeXw/JLIw3mwPlII=; b=3KDG/RJ3Ym9X5C
	jecjOglTPNq/FcZLbiuy0CFjDyTZMfhx3FYr29uePCnunVrxQWO2fDUuOaFtFM2pzdZ0Af3rATMqo
	WQYdStJYZ3dWPTc3kJlCD9KnQNVMePjeVmx7Pp6x/rEAl4lrqLRsumVjakDuXWPzhPLhj64FtXmpY
	8NuPHF/U7XQZ/8VHGf71LJ+s8X6U2am2yc4fKqqKRBhuP8OcU5oTBRWcWoNzV0Ng2Xe+P8/52cvs8
	q4supMV+Yod0WAAI6wZLYpkgFHuTnfdgT+E6r+/BY+BIEBhkRUR/eOTQA3gCgU4/b0xw6LPpBPZOG
	8d4aURCsirnQnGDTJl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyed-000000028cy-0lt2;
	Sat, 31 Jan 2026 00:15:59 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlyea-000000028bj-2nYR
	for kvm-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 00:15:57 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7d15b8feca3so2677952a34.3
        for <kvm-riscv@lists.infradead.org>; Fri, 30 Jan 2026 16:15:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769818555; cv=none;
        d=google.com; s=arc-20240605;
        b=Va829jGY0QUeaCr/zexVFyyu6CIR59stoBoRsH46pppg5bxzzpjOcEzMB+JC4BYv6p
         rieMbRKtoMymC/Rr16L+aAnbDPPB3qVO7HBB6VaFgAK6GtgmmGPJsqLBSsoWnUaa/OD3
         ZNu0ny6MKTBXP0qzazYQ192xhxK81kGrQQLr3XYRHzZ1o07il50iCnmKjMAnFvpakfUA
         fk9TckoEQ5xJlOOFrcBRhXBiHFu5w6mSsvNzQvUVIgRihApmyXQbrO+ZICZjj/ke580v
         0+p79XDjaJbYcWFxgfAUNP38drpAnt2U1La8j0+zQrRPJxZ5foYp0QnUeyVx90VCluzE
         m7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRm5sfCTEKVx/sN5RzP4+dvvkIsVmkN2zIPCD6RD2hs=;
        fh=Ur7cVIUvfpiirW5aNLH8BxvG4vgcPsOSlYrsErtBpvo=;
        b=DImwCo+54sqO4rSNaWyLTejufv6/Ps4ThRbWscIX3YqOh0bbUKVUByPViZ9Ia1caU9
         2EvEldstbk4yLuhg/YYowueD2qLJlkfFGp/Jabvx2UUVzO6RjBsSvIShb2+/qOeSrEM2
         JMAV5wHeqexR1iWresS2Yis3qOmEtywaz29CSzCznpfeu9Jq0D1iZJdU5Jb2T0x2b6Oy
         2LmhhQn3g1P+TuPIl741nsd0yg5iHPohGzqvWRi2hQ2laz9l0sbIg9fHqDSzkqQp9Ob5
         LqzLxoHVY5jcBaNtFxcI7/Hs+v5KjqenV40bvbVgVIUYLsZ+eT7XUzQAszSXc/85CXX1
         vftw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769818555; x=1770423355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRm5sfCTEKVx/sN5RzP4+dvvkIsVmkN2zIPCD6RD2hs=;
        b=nFEZs59mKqc0JxhfIxYbYsiAXXGBSf3jt+ICfrDrNLGXbVZI4gZVzl4h2ubInHMYwv
         tQr5PD4dhuO8L/5wZcPnRrS4kjjF29YMk6xc0a51t0fUg4pKmRusHEsNwFypVx1xy0aj
         vpastDLz7SY6CyJRzJikNlhboLUJglL1UcyPjSVNuwYT1tA9/F3f6nRCh0qTor4EuAjE
         tU4aRHAnaeIYgNiODRXqNlhVzBgiMMA2w/Dit5NuCLV0M3JdtIkiDTjzX4c8dwZ7/qat
         jGh3Zpfdv5QRnm4yqUttBbSHkGKW33lvvFSE1yaY0X/zzqWMdS75JplS1IUIDd5wZW6T
         tNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769818555; x=1770423355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yRm5sfCTEKVx/sN5RzP4+dvvkIsVmkN2zIPCD6RD2hs=;
        b=SE/5MNw+0I8gyhy2HivF0eI7FZtb76ALz59tks06tqmSW8AFBnCGwN0+eI6RATrEkO
         apGZFtNBw/z0Dx70BFBipFUrC4jbvcLmeCeVrbCTJtYClfZPF5v+ki4n6MIQtceKXLOD
         DJiqaGqVt8inLryM1QfJ04I65OvJycC094yvLHJJYCn/jZcXwY9zRjoB0Qt5rUHXAUB5
         bbYbMprGfJp1IZ7Y1iiz5wXHauFKJxfGmdSCm4/STi4zaL16XlEb7BCvy8Oncd6+JqOV
         cD/6eHQuhrYtnh+tSa8jgP9DiLfOM5Fmc2PjqTQWqU+UMlXqZwD/xCzFTwcOM6D1Q6az
         Gklw==
X-Forwarded-Encrypted: i=1; AJvYcCXK62uieBYAuzhPlpeo0nPM8s/oa9PJ+ufPbHStqAMnKzfRUSbnb8H/+i4cP9xrzrmK5saRHQsyEdw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxofLLpeLoRzH1YJoECD8tXX8DtvC+npG2L5JARXKaeEE5uPT9Z
	6QCPhEvLvWwMGkjF4dHUKaXXae/7xHxKfGkNQX/1at9DpDkHkD81QSmPhp+doyFxprOyv42ED51
	k2KuUrkPzN3KAGVjCu6RuqKgE2hys6Nk=
X-Gm-Gg: AZuq6aKI02wgAIiAxBZpECs8H4462Nk2BHwp7m2TO9PiWGNWMDZUpbHbSZLgWcsxeaP
	K9vaey1i6bRSsg/mDweoLsLk0aOasUd4nusKhlZ7g3aOU7dSBbZLPZiot8+MmxgBTeugIArSlYf
	GE/skITOZ9xXodnkcMO74++oKqNzNrIsfbdxXSwyNUmqdQ2BNObqKS04WQR5SZ8XjFmUkJfjiZe
	3j/86IeKAZxzOBVbPgdv+UqfHEhnxVXi/u8XEOoRqdLiYtBfsEkw3FpXnmyeDw4xBA+z3dbUYCm
	/zo98spuRfD+7wBnkg20hxQEug==
X-Received: by 2002:a05:6820:4489:b0:659:9a49:8f33 with SMTP id
 006d021491bc7-6630f3a6d87mr1889512eaf.68.1769818554970; Fri, 30 Jan 2026
 16:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20260124022042.2168136-1-xujiakai2025@iscas.ac.cn> <ydibz63oh6tj66utjlemeikxg7iateqoox3bwg7r4pdvbwijoj@5zxhlhesvv2t>
In-Reply-To: <ydibz63oh6tj66utjlemeikxg7iateqoox3bwg7r4pdvbwijoj@5zxhlhesvv2t>
From: eanut 6 <jiakaipeanut@gmail.com>
Date: Sat, 31 Jan 2026 08:15:44 +0800
X-Gm-Features: AZwV_QiUFp1qYkWALkWr6hfzyepY58cE_Y-BcKFDEwgeIpp64Dx1DEYCOS4-mFo
Message-ID: <CAFb8wJsPgfE2WRE2wcuYUwkqr27vGOPVv_VHJttQzWoA3dL_0Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Validate SBI STA shmem alignment in kvm_sbi_ext_sta_set_reg
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_161556_739855_5D3DF798 
X-CRM114-Status: GOOD (  16.95  )
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKSeKAmWxsIHNlbmQgYSB2MiBzaG9ydGx5IHdpdGggdGhl
c2UgY2hhbmdlcy4KClRoYW5rcywKSmlha2FpCgpPbiBTYXQsIEphbiAzMSwgMjAyNiBhdCA0OjQ4
4oCvQU0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6
Cj4KPiBPbiBTYXQsIEphbiAyNCwgMjAyNiBhdCAwMjoyMDo0MkFNICswMDAwLCBKaWFrYWkgWHUg
d3JvdGU6Cj4gLi4uCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3Rh
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+ID4gaW5kZXggYWZhMDU0NWMzYmNm
Yy4uN2RmZTY3MWM0MmVhYSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X3N0YS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+ID4gQEAgLTE4
NiwyMyArMTg2LDI1IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfc3RhX3NldF9yZWcoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0sCj4gPiAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gICAgICAgdmFsdWUgPSAqKGNvbnN0IHVuc2lnbmVkIGxvbmcg
KilyZWdfdmFsOwo+ID4KPiA+ICsgICAgIGdwYV90IG5ld19zaG1lbSA9IHZjcHUtPmFyY2guc3Rh
LnNobWVtOwo+Cj4gUGxlYXNlIGRlY2xhcmUgbmV3X3NobWVtIGF0IHRoZSB0b3Agb2YgdGhlIGZ1
bmN0aW9uIGFuZCB0aGVyZSdzIG5vCj4gbmVlZCB0byBpbml0aWFsaXplIGl0IHRvIHZjcHUtPmFy
Y2guc3RhLnNobWVtLiBBY3R1YWxseSBpdCBhcHBlYXJzIHlvdQo+IG1lYW50IHRvIGluaXRpYWxp
emUgaXQgdG8gTlVMTCwgYmFzZWQgb24gdGhlICdpZiAobmV3X3NobWVtIC4uLiknIGNoZWNrCj4g
YmVsb3cuCj4KPiA+ICsKPiA+ICAgICAgIHN3aXRjaCAocmVnX251bSkgewo+ID4gICAgICAgY2Fz
ZSBLVk1fUkVHX1JJU0NWX1NCSV9TVEFfUkVHKHNobWVtX2xvKToKPiA+ICAgICAgICAgICAgICAg
aWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAg
IGdwYV90IGhpID0gdXBwZXJfMzJfYml0cyh2Y3B1LT5hcmNoLnN0YS5zaG1lbSk7Cj4gPgo+ID4g
LSAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guc3RhLnNobWVtID0gdmFsdWU7Cj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgdmNwdS0+YXJjaC5zdGEuc2htZW0gfD0gaGkgPDwgMzI7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgbmV3X3NobWVtID0gdmFsdWU7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgbmV3X3NobWVtIHw9IGhpIDw8IDMyOwo+ID4gICAgICAgICAgICAgICB9IGVs
c2Ugewo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guc3RhLnNobWVtID0gdmFs
dWU7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgbmV3X3NobWVtID0gdmFsdWU7Cj4gPiAgICAg
ICAgICAgICAgIH0KPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICBjYXNlIEtWTV9S
RUdfUklTQ1ZfU0JJX1NUQV9SRUcoc2htZW1faGkpOgo+ID4gICAgICAgICAgICAgICBpZiAoSVNf
RU5BQkxFRChDT05GSUdfMzJCSVQpKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZ3BhX3Qg
bG8gPSBsb3dlcl8zMl9iaXRzKHZjcHUtPmFyY2guc3RhLnNobWVtKTsKPiA+Cj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgdmNwdS0+YXJjaC5zdGEuc2htZW0gPSAoKGdwYV90KXZhbHVlIDw8IDMy
KTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICB2Y3B1LT5hcmNoLnN0YS5zaG1lbSB8PSBsbzsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBuZXdfc2htZW0gPSAoKGdwYV90KXZhbHVlIDw8IDMy
KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBuZXdfc2htZW0gfD0gbG87Cj4gPiAgICAgICAg
ICAgICAgIH0gZWxzZSBpZiAodmFsdWUgIT0gMCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gICAgICAgICAgICAgICB9Cj4gPiBAQCAtMjEwLDcgKzIxMiwx
MCBAQCBzdGF0aWMgaW50IGt2bV9zYmlfZXh0X3N0YV9zZXRfcmVnKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgdW5zaWduZWQgbG9uZyByZWdfbnVtLAo+ID4gICAgICAgZGVmYXVsdDoKPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gPiAgICAgICB9Cj4KPiBQbGVhc2UgYWRkIGEgYmxh
bmsgbGluZSBoZXJlLgo+Cj4gPiArICAgICBpZiAobmV3X3NobWVtICYmICFJU19BTElHTkVEKG5l
d19zaG1lbSwgNjQpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiAr
ICAgICB2Y3B1LT5hcmNoLnN0YS5zaG1lbSA9IG5ld19zaG1lbTsKPgo+IEFuZCBhbm90aGVyIGJs
YW5rIGxpbmUgaGVyZS4KPgo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IC0tCj4g
PiAyLjM0LjEKPiA+Cj4KPiBUaGFua3MsCj4gZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
