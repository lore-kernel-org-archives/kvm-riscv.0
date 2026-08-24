Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF23C5DF81
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=POpvLR0PqkTyLXLboZ+9pTWGfPg7Loc5QvOd2LwV+WQ=; b=2HGIV9ltgIeCucuYkLCtB9YMFZ
	yCNDdGw6ZKCPSM1jsCYVOYEqDno0OJiWQjACKFMBaKGcadJdtj7WCM1lTTSpb48hDYRktNp58BFWY
	gIVhLKOeCOjuNcWEyv8v4PkQTFDCCxYSw/Rphn1j6wDxGaGmQoEVv3PAV1hiGxfk6xZGZFK77qquq
	JdOvz5NURyuq8OVQkNTZdUkGj8GENpoDQyUb0ZgNa3166En3ZWIhFcXBy60A9fuVix9HHJf4YD3BU
	IOZZLu4X2/zSQtljRSdp2CYUIV+mUKjBHZaEykC3yRV63NZcbkl7G2Cmhy9I433N2ThATBxiKLhud
	v8PBO6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyc6x-0000000HP4e-1P3X;
	Mon, 24 Aug 2026 21:21:43 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyc6r-0000000HP42-3U9c
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 21:21:41 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-8485d853b08so6235162b3a.1
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Aug 2026 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787606495; x=1788211295; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NU4DYUq1t/9abu87crupOiETuM25Ll46MNDzgrp8Cdg=;
        b=ZfUn2RI74L9nEEFv6MANyv45UX5A3qrmlakwFeiIVRdudO/RBr8XL+9vc5EGRtaP9o
         DDTFDBbp+UmTOVF/vIWpTvYQg6wVkLriAsrgmJnXdz59VmxgZPA9h4RBlaoZHEu5mgRv
         Z7wcxVcyHIJjIXg2HAVdtdJrpCsRwiBNPKLvcCAIAOikuWcGrEXIocyH9b0eZj5aIqhO
         Upe86DRjFttVtOcZoCzyqkGeh7qvuSrunpRszKXe18xbbJLyz2T7fFeYcICAkob0i5fp
         ftIvOJkD52PfOD4A32YTpt9o4JIJ7JssvKFZgjvycfpq41lA5MyviH1/bzemsd9i9Xz+
         dRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787606495; x=1788211295;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NU4DYUq1t/9abu87crupOiETuM25Ll46MNDzgrp8Cdg=;
        b=jGwxoS2axYkBImgLmjVkrbIG3vJm+Cl1NeeRsBH5pSVCDh+yjO9VCNMJ/OC4KpoASu
         L3iHoFScTrJ5sAXXgA7uLftNYBNvDqyEekQog7DEeQK+BYq0pwqipCBHoUMSLbWfI7hv
         DWaf8WcUPFSE56+BwMH6GmTqUf94agS5JkZNVQ5wNL2ZxjKP1lLM9b4gxdUUFLQI8Un0
         KtiM6m9aa3dJa+USuRFT5GrojrkusBjlNpOUsQT3EHsBtKaswAdwVufV94Vc9Fg+ObFc
         78X/+M4DZZWufEXZJYRJPpuliYPzbYZxqFGi6/qWKkeZqELIewvulspdYSeHQ389iIrJ
         DHHw==
X-Forwarded-Encrypted: i=1; AHgh+RpArs5mjXr1BDSgq2pUMEJJ+5sXmTWwLi6vYbwT+Jn5qQ/SajW18mjk5BjrBYq33ky14yDrE8xtI7w=@lists.infradead.org
X-Gm-Message-State: AFuF++kG6B82rA8aSSA/KSmcWE1/diDQz/5lmwfZPCqYBfYhV8VFZK3h
	/9aVfuK3T+3wlO5Nwto/PqlxqHIM15m6dt8jyeiZvg1Wy6+PWxc3vKF/HHs0lTtu0f23y8x7M33
	NAeDNww==
X-Received: from pfoi3.prod.google.com ([2002:aa7:87c3:0:b0:847:9805:8254])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:398a:b0:84e:2722:5d9e
 with SMTP id d2e1a72fcca58-851f9bb5de5mr47827595b3a.1.1787606494792; Mon, 24
 Aug 2026 14:21:34 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:21:34 -0700
In-Reply-To: <20260820220340.GC618052.vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-9-vipinsh@google.com>
 <ampPd9szwRoGKwds@google.com> <20260820220340.GC618052.vipinsh@google.com>
Message-ID: <aoy13na7ceOOeh0K@google.com>
Subject: Re: [PATCH v4 8/9] KVM: selftests: Add rule to generate default tests
 for KVM selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, anup@brainfault.org, atish.patra@linux.dev, 
	zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_142140_336373_54DCF9B5 
X-CRM114-Status: GOOD (  22.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 20, 2026, Vipin Sharma wrote:
> On Wed, Jul 29, 2026 at 12:07:35PM -0700, Sean Christopherson wrote:
> > @@ -347,15 +345,13 @@ $(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH)/%.o
> >  $(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH)/%.o: $(ARCH)/%.c
> >         $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> >  
> > -# Default testcases for KVM selftests runner will be generated in this directory.
> > -DEFAULT_TESTCASES = testcases_default_gen
> > +TEST_FILES := $(selfdir)/kvm/runner
> 
> Downside of this one is that if someone is not planning to use runner they
> will still get this directory copied.
> 
> Should we instead add 'rsync -u' in 'testcases' rule below which can copy
> runner only when it is updated or not present? This would be similar to
> original patch but instead of 'cp' it will be 'rsync' command. This will
> also copy runner when someone is explicitly using it.

Hmm, but someone could be using the runner without (re)generating the default
testcases.  We could add a "runner" target, but that seems like overkill.

I'm good with either option, but I think my vote would be have the runner get
copied on install, i.e. just do the "TEST_FILES := $(selfdir)/kvm/runner" above.
But again, either way works for me.

> I think we should also include 'tests' directory which we are using for
> custom testcases and they also .

Heh, they also what?

> >  EXTRA_CLEAN += $(GEN_HDRS) \
> >                $(LIBKVM_OBJS) \
> >                $(SPLIT_TEST_GEN_OBJ) \
> >                $(TEST_DEP_FILES) \
> >                $(TEST_GEN_OBJ) \
> > -              $(OUTPUT)/$(DEFAULT_TESTCASES) \
> >                cscope.*
> >  
> >  $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c $(GEN_HDRS)
> > @@ -386,21 +382,18 @@ cscope:
> >         cscope -b
> >  
> >  # Generate runner testcases in DEFAULT_TESTCASES directory.
> > -# $(OUTPUT) is either CWD or specified in the make command.
> > -tests_install: list_progs = $(patsubst $(OUTPUT)/%,%,$(TEST_GEN_PROGS))
> > -tests_install:
> > -       $(foreach tc, $(TEST_PROGS), \
> > -               $(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(patsubst %.sh,%,$(tc))))
> > -       $(foreach tc, $(TEST_PROGS), \
> > -               $(shell echo $(tc) > $(patsubst %.sh,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> > +DEFAULT_TESTCASES = default_testcases
> > +
> > +testcases: list_progs = $(notdir $(patsubst $(OUTPUT)/%,%,$(TEST_GEN_PROGS)))
> > +testcases: install
> > +       $(foreach tc, $(notdir $(TEST_PROGS)), \
> > +               $(shell mkdir -p $(INSTALL_PATH)/$(DEFAULT_TESTCASES)/$(notdir $(patsubst %.sh,%,$(tc)))))
> > +       $(foreach tc, $(notdir $(TEST_PROGS)), \
> > +               $(shell echo $(tc) > $(patsubst %.sh,$(INSTALL_PATH)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> >  
> >         $(foreach tc, $(list_progs), \
> > -               $(shell mkdir -p $(OUTPUT)/$(DEFAULT_TESTCASES)/$(tc)))
> > +               $(shell mkdir -p $(INSTALL_PATH)/$(DEFAULT_TESTCASES)/$(tc)))
> >         $(foreach tc, $(list_progs), \
> > -               $(shell echo $(tc) > $(patsubst %,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> > -
> > -       @if [ ! -d $(OUTPUT)/runner ]; then             \
> > -               cp -r $(selfdir)/kvm/runner $(OUTPUT);  \
> > -       fi
> > +               $(shell echo $(tc) > $(patsubst %,$(INSTALL_PATH)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
> 
> All looks good here.
> 
> Should I send a next version of this series with the changes you have
> suggested or you wanna take the diff you created and apply before merge?

Go ahead and send the next version.  Given the number of tweaks, it'd be helpful
to be closer to WYSIWYG.  My changes are at:

  https://github.com/sean-jc/linux slf/runner

if you want to use that as a reference and/or grab changes directly.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
